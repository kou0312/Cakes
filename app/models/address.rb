class Address < ApplicationRecord
  belongs_to :customer
  has_many :order
  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end
end
