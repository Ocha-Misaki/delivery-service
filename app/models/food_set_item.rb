class FoodSetItem < ApplicationRecord
  belongs_to :food
  belongs_to :food_set
  validates :food_id, uniqueness: { scope: :food_set_id, message: "食材はすでに登録されています" }
end
