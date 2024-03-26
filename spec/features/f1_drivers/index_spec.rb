require 'rails_helper'

RSpec.describe "F1 Drivers index page" do
  before(:each) do
    @mercedes = F1Team.create!(name: "Mercedes", horsepower: 1001, slick_tires: true)
    @haas = F1Team.create!(name: "Haas", horsepower: 1000, slick_tires: false)

    @luis = @mercedes.f1_drivers.create!(name: "Luis Hamilton", weight: 163, world_champion: true)
    @kevin = @haas.f1_drivers.create!(name: "Kevin Magnussen", weight: 148, world_champion: false)
  end
  
  
  describe 'User Story 3' do
    it "displays f1 driver name and attributes" do
      visit "/f1_drivers"

      expect(page).to have_content(@luis.name)
      expect(page).to have_content(@luis.weight)
      expect(page).to have_content(@luis.world_champion)
      expect(page).to have_content(@kevin.name)
      expect(page).to have_content(@kevin.weight)
      expect(page).to have_content(@kevin.world_champion)
    end
  end

  describe 'User Story 8' do
    it "Displays link to f1 drivers index on all pages" do
      visit "/f1_teams"

      expect(page).to have_link("F1 Drivers", href: "/f1_drivers")
      click_on "F1 Drivers"
      expect(current_path).to eq("/f1_drivers")
    end

    it "Displays link to f1 drivers index on all pages" do
      visit "/f1_drivers"

      expect(page).to have_link("F1 Drivers", href: "/f1_drivers")
      click_on "F1 Drivers"
      expect(current_path).to eq("/f1_drivers")
    end
  end

  describe 'User Story 9' do
    it "Displays link to f1 teams index on all pages" do
      visit "/f1_drivers"

      expect(page).to have_link("F1 Teams")
      click_on "F1 Teams"
      expect(current_path).to eq("/f1_teams")
    end

    it "Displays link to f1 teams index on all pages" do
      visit "/f1_teams"

      expect(page).to have_link("F1 Teams")
      click_on "F1 Teams"
      expect(current_path).to eq("/f1_teams")
    end
  end
end