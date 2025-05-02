class FoodSet < ApplicationRecord
  has_many :food_set_items, dependent: :restrict_with_exception
  has_many :foods, through: :food_set_items
  has_many_attached :recipes

  validates :name, presence: true
  validates :price, presence: true
  validates :total_weight, presence: true
  validate :validate_recipes

  scope :default_order, -> { order(created_at: :desc) }
  scope :refrigerated, -> { where(refrigerated: true) }

  private

  def validate_recipes
    return unless recipes.attached?

    recipes.each do |recipe|
      unless recipe.content_type.in?(%w[application/pdf])
        errors.add(:recipes, 'ファイル形式が、pdf以外になってます。ファイル形式をご確認ください。')
      end

      if recipe.byte_size > 10.megabytes
        errors.add(:recipes, '10MB以下のファイルをアップロードしてください。')
      end
    end
  end
end
