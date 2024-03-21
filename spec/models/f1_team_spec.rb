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
end