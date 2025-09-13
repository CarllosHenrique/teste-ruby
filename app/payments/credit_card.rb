class CreditCard < Payments::Base
  def charge!(invoice:, client:)
    log_payment(invoice:, client:)
    true
  end
end
