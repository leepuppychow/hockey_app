require "rails_helper"

describe "Leagues API" do
  it "POST /api/v1/leagues will create a hockey league" do
    params = {
      name: "BBAHL - C division",
    }
    post "/api/v1/leagues", params: params

    league = JSON.parse(response.body)

    expect(response.status).to eq 201
    expect(league["name"]).to eq "BBAHL - C division"
    expect(league["created_at"]).to be_a(String)
    expect(league["updated_at"]).to be_a(String)
  end

  it "league name is required in payload" do
    params = {}
    post "/api/v1/leagues", params: params

    error = JSON.parse(response.body)

    expect(response.status).to eq 400
    expect(error["error"]).to eq "Error creating new hockey league" 
  end 
end