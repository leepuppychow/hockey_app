require "rails_helper"

describe "Leagues API" do
  it "/api/v1/leagues will return an array of hockey leagues" do
    league_1 = League.create!(name: "NHL")
    season_1 = Season.create!(name: "2020-2021", league: league_1)
    team_1 = Team.create!(name: "Colorado Avalanche", season: season_1)
    team_2 = Team.create!(name: "Las Vegas Golden Knights", season: season_1)
    league_2 = League.create!(name: "AHL")

    get '/api/v1/leagues'

    leagues = JSON.parse(response.body)

    expect(leagues.count).to eq 2
    expect(leagues.first["name"]).to eq "NHL"
    expect(leagues.first["seasons"]).to be_a Array
    expect(leagues.first["seasons"].first["name"]).to eq "2020-2021"
    
    avs, goons = leagues.first["seasons"].first["teams"]
    expect(avs["name"]).to eq "Colorado Avalanche"
    expect(goons["name"]).to eq "Las Vegas Golden Knights"
  end
end