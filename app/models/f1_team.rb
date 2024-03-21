class F1Team < ApplicationRecord
  has_many :f1_drivers

  validates :name, presence: true
  validates :horsepower, presence: true
  #validates :slick_tires, presence: true
end