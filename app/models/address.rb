class Address < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :order
  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end
end
