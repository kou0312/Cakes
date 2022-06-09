class Customer < ApplicationRecord
  has_many :addresses,  dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders,     dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def view_postal_code_and_address_and_last_name_and_first_name
    self.postal_code + self.address + self.last_name + self.first_name
  end

end
