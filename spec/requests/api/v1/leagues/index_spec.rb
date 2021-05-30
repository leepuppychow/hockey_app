require "rails_helper"

describe "Leagues API" do
  it "/api/v1/leagues will return an array of hockey leagues" do
    league_1 = League.create!(name: "NHL")
    league_2 = League.create!(name: "AHL")
    league_3 = League.create!(name: "BBAHL")

    get '/api/v1/leagues'

    leagues =  JSON.parse(response.body)

    expect(leagues.count).to eq(3)
    expect(leagues.first["name"]).to be_a(String)
  end
end