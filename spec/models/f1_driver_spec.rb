require "rails_helper"

RSpec.describe F1Driver, type: :model do
  describe 'relationships' do
    it {should belong_to(:f1_team)}
  end
end