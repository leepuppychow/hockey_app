require "rails_helper"

describe "Teams API" do
  it "GET /api/v1/seasons/:season_id/teams will get all teams from a season" do
    league = League.create!(name: "NHL")
    season = Season.create!(name: "2020-2021", league: league)
    avs = Team.create!(name: "Colorado Avalanche", season: season)
    mack = Player.create!(name: "Nathan MacKinnon", team: avs)
    landy = Player.create!(name: "Gabriel Landeskog", team: avs)

    blues = Team.create!(name: "St. Louis Blues", season: season)
    goons = Team.create!(name: "Las Vegas Golden Knights", season: season)

    get "/api/v1/seasons/#{season.id}/teams"

    teams_json = JSON.parse(response.body)

    avs_json, blues_json, goons_json = teams_json
    expect(avs_json["name"]).to eq avs.name
    mack_json, landy_json = avs_json["players"]
    expect(mack_json["name"]).to eq mack.name
    expect(landy_json["name"]).to eq landy.name

    expect(blues_json["name"]).to eq blues.name
    expect(goons_json["name"]).to eq "Las Vegas Golden Knights"
  end

  it "will return 404 if season is not found" do
    get "/api/v1/seasons/0/teams"
    expect(response.status).to eq 404
  end
end