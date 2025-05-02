class DeliverySchedule < ApplicationRecord
  belongs_to :order

  validates :time_period, presence: true
  validates :scheduled_on, presence: true
  validates :status, presence: true
end
