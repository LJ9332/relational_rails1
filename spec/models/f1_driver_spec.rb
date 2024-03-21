require "rails_helper"

RSpec.describe F1Driver, type: :model do
  describe 'relationships' do
    it {should belong_to(:f1_team)}
  end

  describe 'vaildations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :weight}
    #it {should validate_presence_of :world_champion}
  end
end