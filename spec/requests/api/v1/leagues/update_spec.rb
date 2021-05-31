require "rails_helper"

describe "Leagues API" do
  it "PUT /api/v1/leagues/:id will update a hockey league" do
    league = League.create!(name: 'BBAHL - D')
    params = {
      name: "BBAHL - D4 division",
    }
    put "/api/v1/leagues/#{league.id}", params: params

    league = League.find(league.id)

    expect(response.status).to eq 200
    expect(league["name"]).to eq "BBAHL - D4 division"
  end

  it "league name is required in payload" do
    league = League.create!(name: 'BBAHL - D')
    params = {
      hello: "there"
    }
    put "/api/v1/leagues/#{league.id}", params: params

    error = JSON.parse(response.body)

    expect(response.status).to eq 400
    expect(error["error"]).to eq "Error updating hockey league: #{league.id}"
    expect(league.name).to eq "BBAHL - D"
  end 
end