class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :plan, presence: true
  validates :schedule, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

  extend Enumerize
  enumerize :plan, in: [ :light, :standard, :family ], predicates: { prefix: true }
  enumerize :schedule, in: [ :weekly, :monthly ], predicates: { prefix: true }
end
