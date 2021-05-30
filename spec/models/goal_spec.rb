require "rails_helper"

describe Goal, type: :model do
  describe "relationships" do
    it {should belong_to(:player)}
    it {should belong_to(:game)}
  end
end