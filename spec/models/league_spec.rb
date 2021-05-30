require "rails_helper"

describe League, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:rink_name)}
  end

  describe "relationships" do
    it {should have_many(:teams)}
  end
end 