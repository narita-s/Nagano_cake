class Address < ApplicationRecord
  belongs_to :customer

  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

  def full_address
   postal_code.to_s + " " + address.to_s
  end
end
