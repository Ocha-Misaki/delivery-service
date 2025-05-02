class DeliverySubscription < ApplicationRecord
  belongs_to :user

  validates :planned_delivery_on, presence: true
  validates :next_delivery_on, presence: true
end
