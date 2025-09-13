# == Schema Information
#
# Table name: invoices
#
#  id                   :integer          not null, primary key
#  client_id            :integer          not null
#  year                 :integer
#  month                :integer
#  status               :string
#  payment_method_key   :string
#  error_message        :text
#  metadata_retry_count :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_invoices_on_client_id                     (client_id)
#  index_invoices_on_client_id_and_year_and_month  (client_id,year,month) UNIQUE
#

# app/models/invoice.rb
class Invoice < ApplicationRecord
  belongs_to :client

  enum :status, { pending: "pending", paid: "paid", failed: "failed" }, default: "pending"

  validates :year, :month, :status, presence: true
  validates :month, inclusion: { in: 1..12 }
end
