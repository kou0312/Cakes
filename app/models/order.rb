class Order < ApplicationRecord
  belongs_to :customer,optional: true
  belongs_to :address,optional: true
  has_many :order_details, dependent: :destroy


 enum payment_method: { credit_card: 0, transfer: 1 }

end
