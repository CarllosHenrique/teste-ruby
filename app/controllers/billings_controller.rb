class BillingsController < ApplicationController
  def run_today
    DailyBillingJob.perform_now
    redirect_to clients_path, notice: t("billing.run_today.success")
  end
end
