require 'rails_helper'

RSpec.describe "F1 teams show page" do
  before(:each) do
    @mercedes = F1Team.create!(name: "Mercedes", horsepower: 1001, slick_tires: true)
    @haas = F1Team.create!(name: "Haas", horsepower: 1000, slick_tires: false)

    @luis = @mercedes.f1_drivers.create!(name: "Luis Hamilton", weight: 163, world_champion: true)
    @valtteri = @mercedes.f1_drivers.create!(name: "Valtteri Bottas", weight: 158, world_champion: false)
  end
  
  
  describe 'User Story 2' do
    it "displays f1 team name and attributes" do
      visit "f1_teams/#{@mercedes.id}"

      expect(page).to have_content(@mercedes.name)
      expect(page).to have_content(@mercedes.horsepower)
      expect(page).to have_content(@mercedes.slick_tires)

      expect(page).to_not have_content(@haas.name)
      expect(page).to_not have_content(@haas.horsepower)
      expect(page).to_not have_content(@haas.slick_tires)
    end
  end

  describe 'User Story 7' do
    it "counts the amount of drivers for a single team" do
      visit "f1_teams/#{@mercedes.id}"

      expect(page).to have_content(@mercedes.name)
      expect(page).to have_content("Number of Drivers: 2")
    end
  end
end