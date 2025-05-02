class FoodSet < ApplicationRecord
  has_many :food_set_items, dependent: :restrict_with_exception
  has_many :foods, through: :food_set_items
  has_one_attached :recipe

  validates :name, presence: true
  validates :price, presence: true
  validates :total_weight, presence: true
  validate :validate_recipe

  scope :default_order, -> { order(created_at: :desc) }
  scope :refrigerated, -> { where(refrigerated: true) }

  private

  def validate_recipe
    return unless recipe.attached?

    if !recipe.content_type.in?(%w[application/pdf])
      errors.add(:recipe, 'ファイル形式がpdf以外になっています。ファイル形式をご確認ください。')
    elsif recipe.byte_size > 10.megabytes
      errors.add(:recipe, '10MB以下のファイルをアップロードしてください。')
    end
  end
end
