require 'rails_helper'

RSpec.describe "F1 Drivers show page" do
  before(:each) do
    @mercedes = F1Team.create!(name: "Mercedes", horsepower: 1001, slick_tires: true)
    @haas = F1Team.create!(name: "Haas", horsepower: 1000, slick_tires: false)

    @luis = @mercedes.f1_drivers.create!(name: "Luis Hamilton", weight: 163, world_champion: true)
    @kevin = @haas.f1_drivers.create!(name: "Kevin Magnussen", weight: 148, world_champion: false)
  end
  
  
  describe 'User Story 4' do
    it "displays a single f1 driver and attributes" do
      visit "/f1_drivers/#{@luis.id}"

      expect(page).to have_content(@luis.name)
      expect(page).to have_content(@luis.weight)
      expect(page).to have_content(@luis.world_champion)
      
      expect(page).to_not have_content(@kevin.name)
      expect(page).to_not have_content(@kevin.weight)
      expect(page).to_not have_content(@kevin.world_champion)
    end
  end

  describe 'User Story 14' do
    it "Displays a link to update a driver" do
      visit "/f1_drivers/#{@luis.id}"
      
      expect(page).to have_link("Update F1 Driver")
      click_on "Update F1 Driver"
      expect(current_path).to eq("/f1_drivers/#{@luis.id}/edit")

      expect(page).to have_field("Name")
      expect(page).to have_field("Weight")
      expect(page).to have_field("World Champion")

      fill_in "Name", with: "Max Verstappen"
      fill_in "Weight", with: "145"
      fill_in "World Champion", with: false

      expect(page).to have_button("Update")
      click_on "Update"
      expect(current_path).to eq("f1_drivers/#{@luis.id}")

      expect(page).to have_content("Max Verstappen")
      expect(page).to have_content("145")
      expect(page).to have_content("false")

      expect(page).to_not have_content("Luis Hamilton")
      expect(page).to_not have_content("163")
      expect(page).to_not have_content("true")
    end
  end
end