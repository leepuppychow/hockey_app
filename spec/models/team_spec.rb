  require "rails_helper"

  describe Team, type: :model do
    describe "validations" do
      it {should  validate_presence_of(:name)}
    end

    describe "relationships" do
      it {should belong_to(:season)}
      it {should have_many(:home_games)}
      it {should have_many(:away_games)}
    end
  end