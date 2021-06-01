require "rails_helper"

describe "Seasons API" do
  it "PUT /api/v1/leagues/:league_id/seasons should update season within a league" do
    league = League.create!(name: "NHL")
    season = Season.create!(name: "2020-2021", league: league)
    
    params = {
      name: "2020-2021 Playoffs"
    }
    put "/api/v1/leagues/#{league.id}/seasons/#{season.id}", params: params

    season_json = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(season_json["name"]).to eq "2020-2021 Playoffs"

    expect(league.seasons.count).to eq 1
    expect(league.seasons.first.name).to eq "2020-2021 Playoffs"
  end

  it "Cannot update season from the wrong league" do
    nhl = League.create!(name: "NHL")
    season = Season.create!(name: "2020-2021", league: nhl)
    
    beer_league = League.create!(name: "Beer League")
    
    params = {
      name: "beer league 2021 Summer"
    }
    put "/api/v1/leagues/#{beer_league.id}/seasons/#{season.id}", params: params

    expect(response.status).to eq 400
  end

  it "will return 404 if league is not found" do
    nhl = League.create!(name: "NHL")
    season = Season.create!(name: "2020-2021", league: nhl)
    params = {
      name: "2020-2021 Playoffs"
    }

    put "/api/v1/leagues/0/seasons/#{season.id}", params: params
    error_json = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(error_json['error']).to eq "Cannot find league 0"
  end

  it "will return 404 if season is not found" do
    nhl = League.create!(name: "NHL")
    season = Season.create!(name: "2020-2021", league: nhl)
    params = {
      name: "2020-2021 Playoffs"
    }

    put "/api/v1/leagues/#{nhl.id}/seasons/0", params: params
    error_json = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(error_json['error']).to eq "Cannot find season 0"
  end
end