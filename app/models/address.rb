class Address < ApplicationRecord
  belongs_to :customer

  def full_address
   postal_code.to_s + " " + address.to_s
  end
end
