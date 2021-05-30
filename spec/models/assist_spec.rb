require "rails_helper"

describe Assist, type: :model do
  describe "relationships" do
    it {should belong_to(:player)}
    it {should belong_to(:goal)}
  end
end