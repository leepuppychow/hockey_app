require "rails_helper"

describe "Teams API" do
  it "POST /api/v1/seasons/:season_id/teams will create a team" do
    league = League.create!(name: "NHL")
    season = Season.create!(name: "2020-2021", league: league)

    params = {
      name: "Mighty Pucks"
    }

    post "/api/v1/seasons/#{season.id}/teams", params: params

    team = JSON.parse(response.body)

    expect(response.status).to eq 201
    expect(team["name"]).to eq "Mighty Pucks"
  end
end