require "rails_helper"

describe "Seasons API" do
  it "DELETE /api/v1/leagues/:league_id/seasons/:id should delete season within a league" do
    league = League.create!(name: "NHL")
    season = Season.create!(name: "2020-2021", league: league)
    
    delete "/api/v1/leagues/#{league.id}/seasons/#{season.id}"

    expect(response.status).to eq 204

    expect(league.seasons.empty?).to eq true
  end

  it "Cannot delete season from the wrong league" do
    nhl = League.create!(name: "NHL")
    season = Season.create!(name: "2020-2021", league: nhl)
    
    beer_league = League.create!(name: "Beer League")
    
    delete "/api/v1/leagues/#{beer_league.id}/seasons/#{season.id}"

    expect(response.status).to eq 400
  end

  it "will return 404 if league is not found" do
    nhl = League.create!(name: "NHL")
    season = Season.create!(name: "2020-2021", league: nhl)

    delete "/api/v1/leagues/0/seasons/#{season.id}"
    error_json = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(error_json['error']).to eq "Cannot find league 0"
  end

  it "will return 404 if season is not found" do
    nhl = League.create!(name: "NHL")
    season = Season.create!(name: "2020-2021", league: nhl)

    delete "/api/v1/leagues/#{nhl.id}/seasons/0"
    error_json = JSON.parse(response.body)

    expect(response.status).to eq 404
    expect(error_json['error']).to eq "Cannot find season 0"
  end
end