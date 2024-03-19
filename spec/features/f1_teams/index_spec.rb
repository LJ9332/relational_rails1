require 'rails_helper'

RSpec.describe "F1 teams index page" do
  before(:each) do
    @mercedes = F1Team.create!(name: "Mercedes", horsepower: 1000, slick_tires: true)
    @haas = F1Team.create!(name: "Haas", horsepower: 1000, slick_tires: true)
  end
  
  
  describe 'User Story 1' do
    it "I see all the names of each parent record in the system" do
      visit "/f1_teams"

      expect(page).to have_content(@mercedes.name)
      expect(page).to have_content(@haas.name)
    end
  end
end