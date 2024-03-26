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

  describe 'User Story 10' do 
    it "Displays link to f1 team drivers index" do
      visit "f1_teams/#{@mercedes.id}"

      expect(page).to have_link("F1 Team Drivers")
      click_on "F1 Team Drivers"
      expect(current_path).to eq("/f1_teams/#{@mercedes.id}/f1_drivers")
    end
  end

  describe 'User Story 12' do
    it "Displays a link to update a F1 Team" do
      visit "/f1_teams/#{@mercedes.id}"

      expect(page).to have_link("Update F1 Team")
      click_on "Update F1 Team"
      expect(current_path).to eq("/f1_teams/#{@mercedes.id}/edit")

      expect(page).to have_field("Name")
      expect(page).to have_field("Horsepower")
      expect(page).to have_field("Slick Tires")

      fill_in "Name", with: "McLaren"
      fill_in "Horsepower", with: "999"
      fill_in "Slick Tires", with: false
      
      expect(page).to have_button("Update")
      click_on "Update"
      expect(current_path).to eq("/f1_teams/#{@mercedes.id}")
     
      expect(page).to have_content("McLaren")
      expect(page).to have_content("999")
      expect(page).to have_content("false")

      expect(page).to_not have_content("Mercedes")
      expect(page).to_not have_content("1001")
      expect(page).to_not have_content("true")
    end
  end
end