# app/payments/base.rb
module Payments
  class Base
    def self.key   = name.demodulize.underscore
    def self.label = name.demodulize.titleize

    def charge!(invoice:, client:)
      raise NotImplementedError
    end

    private

    def log_payment(invoice:, client:)
      Rails.logger.info(
        I18n.t("payments.generic.log",
               method: self.class.label,
               client: client.name,
               invoice_id: invoice.id)
      )
    end
  end
end
