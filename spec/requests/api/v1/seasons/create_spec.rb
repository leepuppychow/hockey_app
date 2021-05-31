require "rails_helper"

describe "Seasons API" do
  it "POST /api/v1/leagues/:league_id/seasons should create season within a league" do
    league = League.create!(name: "NHL")
    params = {
      name: "2020-2021 Playoffs"
    }
    post "/api/v1/leagues/#{league.id}/seasons", params: params

    season_json = JSON.parse(response.body)
    expect(response.status).to eq 201
    expect(season_json["name"]).to eq "2020-2021 Playoffs"

    expect(league.seasons.count).to eq 1
    expect(league.seasons.first.name).to eq "2020-2021 Playoffs"
  end

  it "Season payload must have a name" do
    league = League.create!(name: "NHL")
    params = {
      name: ""
    }
    post "/api/v1/leagues/#{league.id}/seasons", params: params
    error_json = JSON.parse(response.body)

    expect(response.status).to eq 400
    expect(error_json["error"]).to eq "Error creating new season"
  end
end