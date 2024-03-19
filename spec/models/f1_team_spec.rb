require "rails_helper"

RSpec.describe F1Team, type: :model do
  describe 'relationships' do
   it {should have_many(:f1_drivers)}
  end
end