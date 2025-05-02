class Food < ApplicationRecord
  has_many :food_set_items, dependent: :restrict_with_exception

  validates :name, presence: true
  validates :allergy_info, presence: true

  scope :default_order, -> { order(created_at: :desc) }
end
