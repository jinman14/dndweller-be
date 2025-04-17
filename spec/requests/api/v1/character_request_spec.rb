require "rails_helper"

describe "character api", type: :request do
<<<<<<< HEAD
  it "should return a small list of all characters details for display" do
    character = create(:character)
    get '/api/v1/characters'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(:ok)
    expect(json[:data].first[:id]).to eq(character.id.to_s)
    expect(json[:data].first[:attributes][:character_name]).to eq(character.name)
    expect(json[:data].first[:attributes][:race]).to eq(character.race)
    expect(json[:data].first[:attributes][:class_name]).to eq(character.class_name)
    expect(json[:data].first[:attributes][:level]).to eq(character.level)
    expect(json[:data].first[:attributes][:creator_name]).to eq(character.user.name)
  end
=======
    describe "GET one character" do
        it "Should return detailed information about one character" do
            char = create(:character)
            sword = create(:sword)
            armor = create(:armor)
            acid_arrow = create(:skill)
            common = create(:language, language: "Common")
            gnomish = create(:language, language: "Gnomish")

            [sword, armor].each { |equipment| create(:character_equipment, character: char, equipment: equipment) }
            create(:character_skill, character: char, skill: acid_arrow)
            [common, gnomish].each { |language| create(:character_language, character: char, language: language) }
            
            get "/api/v1/characters/#{char.id}"
            json = JSON.parse(response.body, symbolize_names: true)[:data]

            expect(response).to have_http_status :ok

            expect(json[:id]).to eq(char.id)
            expect(json[:token_url]).to eq(char.token_url)
            expect(json[:character_name]).to eq(char.name)
            expect(json[:level]).to eq(char.level)
            expect(json[:race]).to eq(char.race)
            expect(json[:class]).to eq(char.class_name)
            expect(json[:gender]).to eq(char.gender)
            expect(json[:speed]).to eq(char.speed)
            expect(json[:languages].length).to eq(2)
            expect(json[:languages][0]).to eq(char.languages[0].language)
            expect(json[:proficiency]).to eq(2)
            expect(json[:armor_class]).to eq(char.ac)
            json[:statistics].each { |stat| expect(json[:statistics][stat]).to eq(char[stat]) }
            expect(json[:equipment].length).to eq(2)
            expect(json[:equipment][0][:name]).to eq(char.equipments.first.name)
            expect(json[:equipment][0][:damage_dice]).to eq(char.equipments.first.damage_dice)
            expect(json[:equipment][0][:damage_type]).to eq(char.equipments.first.damage_type)
            expect(json[:equipment][0][:range]).to eq(char.equipments.first.range.to_i)
            expect(json[:equipment][1][:name]).to eq(char.equipments.last.name)
            expect(json[:equipment][1][:base_ac]).to eq(char.equipments.last.base_ac)
            expect(json[:equipment][1][:dex_bonus]).to eq(char.equipments.last.dex_bonus)
            expect(json[:skills].length).to eq(1)
            expect(json[:skills][0][:name]).to eq(char.skills.first.name)
            expect(json[:skills][0][:level]).to eq(char.skills.first.level)
            expect(json[:skills][0][:damage_type]).to eq(char.skills.first.damage_type)
            expect(json[:skills][0][:range]).to eq(char.skills.first.range)
            expect(json[:skills][0][:description]).to eq(char.skills.first.description)
        end

        it "Should return a 404 error when indexing non existant character" do
            get "/api/v1/characters/1"
            json = JSON.parse(response.body, symbolize_names: true)

            expect(response).to have_http_status :not_found
            expect(json[:message]).to eq("Could not find Character with id 1")
            expect(json[:status]).to eq(404)
        end
    end
>>>>>>> main
end