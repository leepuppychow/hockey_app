require "rails_helper"

describe "User sees all Teams" do
  describe "when they visit /teams" do
    it "displays all the hockey teams" do
      nhl = League.create!(name: "NHL")
      season_1 = Season.create!(name: "2020-2021", league: nhl)
      team_1 = Team.create!(name: "Colorado Avalanche", season: season_1)
      team_2 = Team.create!(name: "Las Vegas Golden Knights", season: season_1)

      visit "/teams"

      save_and_open_page

      expect(page).to have_content(nhl.name)
      expect(page).to have_content(season_1.name)
      expect(page).to have_content(team_1.name)
      expect(page).to have_content(team_2 .name)
    end
  end
end