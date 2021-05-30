require "rails_helper"

describe Game, type: :model do
  describe "relationships" do
    it {should belong_to(:season)}
    it {should belong_to(:home_team)}
    it {should belong_to(:away_team)}
  end
end