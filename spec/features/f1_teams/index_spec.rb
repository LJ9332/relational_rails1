require 'rails_helper'

RSpec.describe "f1 teams index page" do
  before(:each) do
    @mercedes = F1Team.create!(name: "Mercedes", horsepower: 1000, slick_tires: true)
    @haas = F1Team.create!(name: "Haas", horsepower: 1000, slick_tires: true)
  end
  
  
  describe 'user story 1' do
    it "I see the name of each parent record in the system" do
      visit "/f1_teams"

      expect(page).to have_content(@mercedes.name)
      expect(page).to have_content(@haas.name)
    end
  end
end