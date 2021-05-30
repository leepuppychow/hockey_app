require "rails_helper"

describe Season, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
  end
end 