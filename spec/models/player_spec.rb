require "rails_helper"

describe Player, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
  end

  describe "relationships" do
    it {should belong_to(:team)}
    it {should have_many(:goals)}
    it {should have_many(:assists)}
  end
end
