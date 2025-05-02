class FoodSet < ApplicationRecord
  has_many :food_set_items, dependent: :restrict_with_exception
  has_many :foods, through: :food_set_items
  has_many :orders, dependent: :restrict_with_exception
  has_one_attached :recipe

  validates :name, presence: true
  validates :price, presence: true
  validates :total_weight, presence: true
  validate :validate_recipe

  scope :default_order, -> { order(created_at: :desc) }
  scope :refrigerated, -> { where(refrigerated: true) }

  TAX_RATE = 1.10
  SHIPPING_FEE = 500
  ADDITIONAL_SHIPPING_FEE = 800
  REFRIGERATED_FEE = 200

  def price_including_tax
    (price * TAX_RATE).floor
  end

  def allergy_info
    foods.map(&:allergy_info).join(", ")
  end

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
