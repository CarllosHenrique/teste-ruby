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

class Client < ApplicationRecord
  has_many :invoices, dependent: :destroy

  validates :name, :email, :due_day, :payment_method_key, presence: true
  validates :due_day, inclusion: { in: 1..31 }
end