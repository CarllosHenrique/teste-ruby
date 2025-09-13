module Billing
  class RunDailyBilling
    def self.call(date: Date.current)
      Client.where(due_day: date.day).find_each do |client|
        ProcessClientInvoice.call(client: client, date: date)
      end
    end
  end
end
