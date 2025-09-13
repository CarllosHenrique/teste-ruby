# app/services/billing/process_client_invoice.rb
module Billing
  class ProcessClientInvoice
    MAX_RETRIES = 3

    def self.call(client:, date:)
      year, month = date.year, date.month

      invoice = Invoice.find_or_create_by!(client_id: client.id, year: year, month: month) do |inv|
        inv.status = "pending"
        inv.payment_method_key = client.payment_method_key
      end

      return if invoice.paid?

      client.with_lock do
        invoice.reload
        return if invoice.paid?

        method  = PaymentsRegistry.fetch(invoice.payment_method_key).new
        attempt = (invoice.metadata_retry_count || 0) + 1

        begin
          method.charge!(invoice: invoice, client: client)
          invoice.update!(status: "paid", error_message: nil, metadata_retry_count: attempt)
          Rails.logger.info("[BILLING] OK client=#{client.id} invoice=#{invoice.id} method=#{invoice.payment_method_key}")
        rescue => e
          invoice.update!(status: "failed", error_message: e.message, metadata_retry_count: attempt)
          Rails.logger.error("[BILLING] FAIL client=#{client.id} invoice=#{invoice.id} #{e.class}: #{e.message}")
          schedule_retry(invoice) if attempt < MAX_RETRIES
        end
      end
    end

    def self.schedule_retry(invoice)
      delay = 5.minutes * (2 ** (invoice.metadata_retry_count - 1))
      DailyBillingJob.set(wait: delay).perform_later(rescue_invoice_id: invoice.id)
    end
  end
end
