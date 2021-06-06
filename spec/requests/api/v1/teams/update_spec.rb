require "rails_helper"

describe "Teams API" do
  it "PUT /api/v1/seasons/:season_id/teams/:id will update a team" do
    league = League.create!(name: "NHL")
    season = Season.create!(name: "2020-2021", league: league)
    avs = Team.create!(name: "Avalanche", season: season)

    params = {
      name: "Colorado Avalanche"
    }

    put "/api/v1/seasons/#{season.id}/teams/#{avs.id}", params: params

    team_json = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(team_json["id"]).to eq avs.id
    expect(team_json["name"]).to eq "Colorado Avalanche"
  end
end