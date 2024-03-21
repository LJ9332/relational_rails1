class F1Team < ApplicationRecord
  has_many :f1_drivers

  validates :name, presence: true
  validates :horsepower, presence: true
  #validates :slick_tires, presence: true
  
  def self.recent_team
    order(created_at: :desc)
  end
  
  # default_scope -> { order(created_at: :desc) }
end