require "rails_helper"

describe "character api", type: :request do
  it "should return a small list of all characters details for display" do
    character = create(:character)
    get '/api/v1/characters'

    json = JSON.parse(response.body, symbolize_names: true)
binding.pry
    expect(response).to have_http_status(:ok)
    expect(json[:data].first[:id]).to eq(character.id.to_s)
    expect(json[:data].first[:attributes][:character_name]).to eq(character.name)
    expect(json[:data].first[:attributes][:race]).to eq(character.race)
    expect(json[:data].first[:attributes][:class]).to eq(character.class)
    expect(json[:data].first[:attributes][:level]).to eq(character.level)
    expect(json[:data].first[:attributes][:creator_name]).to eq(character.user.name)
  end
end