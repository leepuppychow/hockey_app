require 'rails_helper'

describe "Leagues API" do
  it "DELETE /api/v1/leagues/:id will delete a hockey league" do
    league = League.create!(name: 'BBAHL - D')
    delete "/api/v1/leagues/#{league.id}"

    expect(response.status).to eq 204
    
    league = League.find_by(id: league.id)
    expect(league).to eq nil
  end
end