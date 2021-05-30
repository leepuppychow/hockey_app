require "rails_helper"

describe Season, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
  end

  describe "relationships" do
    it {should have_many(:teams)}
    it {should belong_to(:league)}
  end
end 