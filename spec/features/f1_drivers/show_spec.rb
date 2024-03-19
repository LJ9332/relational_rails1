require 'rails_helper'

RSpec.describe "F1 Drivers show page" do
  before(:each) do
    @mercedes = F1Team.create!(name: "Mercedes", horsepower: 1001, slick_tires: true)
    @haas = F1Team.create!(name: "Haas", horsepower: 1000, slick_tires: false)

    @luis = @mercedes.f1_drivers.create!(name: "Luis Hamilton", weight: 163, world_champion: true)
    @kevin = @haas.f1_drivers.create!(name: "Kevin Magnussen", weight: 148, world_champion: false)
  end
  
  
  describe 'User Story 4' do
    it "displays a single f1 driver" do
      visit "/f1_drivers/#{@luis.id}"

      expect(page).to have_content(@luis.name)
      expect(page).to have_content(@luis.weight)
      expect(page).to have_content(@luis.world_champion)
      
      expect(page).to_not have_content(@kevin.name)
      expect(page).to_not have_content(@kevin.weight)
      expect(page).to_not have_content(@kevin.world_champion)
    end
  end
end