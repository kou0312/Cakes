class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :order_carts
  has_many :cart_items

  def get_image
    image.variant(resize_to_limit: [100, 100]).processed
  end
end
