class F1Driver < ApplicationRecord
  belongs_to :f1_team

  validates :name, presence: true
  validates :weight, presence: true
  #validates :world_champion, presence: true

  def self.world_champion
    where(world_champion: true)
  end
end