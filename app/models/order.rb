class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting: 0, confirmed: 1, production: 2, preparation: 3, sending: 4 }
end
