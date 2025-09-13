class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.includes(:client).order(year: :desc, month: :desc, created_at: :desc).limit(200)
  end
end
