require 'rails_helper'

RSpec.describe "F1 Team Drivers index page" do
  before(:each) do
    @mercedes = F1Team.create!(name: "Mercedes", horsepower: 1001, slick_tires: true)
    @haas = F1Team.create!(name: "Haas", horsepower: 1000, slick_tires: false)

    @luis = @mercedes.f1_drivers.create!(name: "Luis Hamilton", weight: 163, world_champion: true)
    @valtteri = @mercedes.f1_drivers.create!(name: "Valtteri Bottas", weight: 158, world_champion: false)
    @kevin = @haas.f1_drivers.create!(name: "Kevin Magnussen", weight: 148, world_champion: false)
  end
  
  
  describe 'User Story 5' do
    it "displays f1 driver name, attributes, and team name" do
      visit "/f1_teams/#{@mercedes.id}/f1_drivers"

      expect(page).to have_content(@luis.name)
      expect(page).to have_content(@luis.weight)
      expect(page).to have_content(@luis.world_champion)
      expect(page).to have_content(@mercedes.name)

      expect(page).to have_content(@valtteri.name)
      expect(page).to have_content(@valtteri.weight)
      expect(page).to have_content(@valtteri.world_champion)
      expect(page).to have_content(@mercedes.name)
    
      expect(page).to_not have_content(@kevin.name)
      expect(page).to_not have_content(@kevin.weight)
      expect(page).to_not have_content(@haas.name)
    end
  end
end