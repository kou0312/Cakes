class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum address:[:"自宅", :"登録済みの住所から選択", :"新しいお届け先"]
  enum payment_method:{"クレジットカード": 1, "銀行振込": 2 }

end
