require 'rails_helper'

describe "Leagues API" do
  it "GET /api/v1/leagues/:id will show a hockey league" do
    league = League.create!(name: 'BBAHL - D')
    get "/api/v1/leagues/#{league.id}"

    league = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(league["name"]).to eq "BBAHL - D"
  end

  it "cannot find a non-existing league" do
    get "/api/v1/leagues/0"

    error = JSON.parse(response.body)
    expect(response.status).to eq 404
    expect(error["error"]).to eq "Error finding hockey league 0"
  end
end