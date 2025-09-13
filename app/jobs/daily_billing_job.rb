# app/jobs/daily_billing_job.rb
class DailyBillingJob < ApplicationJob
  queue_as :default

  def perform(rescue_invoice_id: nil)
    if rescue_invoice_id
      invoice = Invoice.find(rescue_invoice_id)
      Billing::ProcessClientInvoice.call(client: invoice.client, date: Date.new(invoice.year, invoice.month, 1))
    else
      Billing::RunDailyBilling.call(date: Date.current)
    end
  end
end
