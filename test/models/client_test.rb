# == Schema Information
#
# Table name: clients
#
#  id                 :integer          not null, primary key
#  name               :string
#  email              :string
#  due_day            :integer
#  payment_method_key :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require "test_helper"

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
