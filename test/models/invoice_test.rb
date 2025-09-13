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

require "test_helper"

class InvoiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
