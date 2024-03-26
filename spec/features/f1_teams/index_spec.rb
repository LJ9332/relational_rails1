require 'rails_helper'

RSpec.describe "F1 teams index page" do
  before(:each) do
    @mercedes = F1Team.create!(name: "Mercedes", horsepower: 1000, slick_tires: true, created_at: "2022-04-22")
    @haas = F1Team.create!(name: "Haas", horsepower: 1000, slick_tires: true, created_at: "2023-09-13")
    @red_bull =  F1Team.create!(name: "Red Bull", horsepower: 1002, slick_tires: true)
  end
  
  
  describe 'User Story 1' do
    it "I see all the names of each parent record in the system" do
      visit "/f1_teams"

      expect(page).to have_content(@mercedes.name)
      expect(page).to have_content(@haas.name)
    end
  end

  describe 'User Story 6' do
    it "displays name of f1 team and time it was created" do
      visit "/f1_teams"

      expect(page).to have_content(@mercedes.name)
      expect(page).to have_content(@haas.name)

      expect(page).to have_content("2022-04-22")
      expect(page).to have_content("2023-09-13")
    end
  end

  describe 'User Story 11' do
    it "Displays a link to create a new F1 Team" do
      visit "/f1_teams"

      expect(page).to have_link("Create F1 Team")
      click_on "Create F1 Team"
      expect(current_path).to eq("/f1_teams/new")

      expect(page).to have_field("Name")
      expect(page).to have_field("Horsepower")
      expect(page).to have_field("Slick Tires")

      fill_in "Name", with: "Ferrari"
      fill_in "Horsepower", with: "999"
      fill_in "Slick Tires", with: true
      expect(page).to have_button("Submit")
      click_on "Submit"

      expect(current_path).to eq("/f1_teams")
    end
  end
end