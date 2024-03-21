require "rails_helper"

RSpec.describe F1Team, type: :model do
  describe 'relationships' do
    it {should have_many(:f1_drivers)}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :horsepower}
    #it {should validate_presence_of :slick_tires}
  end

  describe "class methods" do
    describe "self.recent_team" do
      before do
        @mercedes = F1Team.create!(name: "Mercedes", horsepower: 1000, slick_tires: true, created_at: "2022-04-22")
        @haas = F1Team.create!(name: "Haas", horsepower: 1000, slick_tires: true, created_at: "2023-09-13")
        @red_bull =  F1Team.create!(name: "Red Bull", horsepower: 1002, slick_tires: true, created_at: "2024-03-21")

      end

      it "orders most recent to least recent" do
        expect(F1Team.recent_team).to match([@red_bull, @haas, @mercedes])
      end
    end
  end
end