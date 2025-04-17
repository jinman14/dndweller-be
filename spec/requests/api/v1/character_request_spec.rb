require "rails_helper"

describe "character api", type: :request do
    describe "GET one character" do
        xit "Should return detailed information about one character" do
            char = create(:character)
            sword = create(:equipment, name:"Longsword")
            armor = create(:equipment, name:"Leather-Armor")
            acid_arrow = create(:skill, name:"Acid-Arrow")
            common = create(:language, language: "Common")
            gnomish = create(:language, language: "Gnomish")

            [sword, armor].each { |equipment| create(:character_equipment, character: char, equipment: equipment) }
            create(:character_skill, character: char, skill: acid_arrow)
            [common, gnomish].each { |language| create(:character_language, character: char, language: language) }
            
            get "/api/v1/characters/#{char.id}"
            json = JSON.parse(response.body, symbolize_names: true)["data"]

            expect(json["id"]).to eq(char.id)
            expect(json["token_url"]).to eq(char.token_url)
            expect(json["character_name"]).to eq(char.name)
            expect(json["level"]).to eq(char.level)
            expect(json["race"]).to eq(char.race)
            expect(json["class"]).to eq(char.class_name)
            expect(json["gender"]).to eq(char.gender)
            expect(json["speed"]).to eq(char.speed)
            expect(json["languages"].length).to eq(2)
            expect(json["languages"][0]).to eq(char.languages[0])
            expect(json["proficiency"]).to eq(2)
            expect(json["armor_class"]).to eq(char.ac)
            json["statistics"].each { |stat| expect(json["statistics"][stat]).to eq(char[stat]) }
            expect(json["equipment"].length).to eq(2)
            expect(json["equipment"][0]["name"]).to eq(char.equipments.first.name)
            expect(json["equipment"][0]["damage_dic"]).to eq(char.equipments.first.damage_dice)
            expect(json["equipment"][0]["damage_type"]).to eq(char.equipments.first.damage_type)
            expect(json["equipment"][0]["range"]).to eq(char.equipments.first.range)
            expect(json["equipment"][1]["name"]).to eq(char.equipments.last.name)
            expect(json["equipment"][1]["base"]).to eq(char.equipments.last.base_ac)
            expect(json["equipment"][1]["dex_bonus"]).to eq(char.equipments.last.dex_bonus)
            expect(json["skills"].length).to eq(1)
            expect(json["skills"][0]["name"]).to eq(char.skills.first.name)
            expect(json["skills"][0]["level"]).to eq(char.skills.first.level)
            expect(json["skills"][0]["damage_type"]).to eq(char.skills.first.damage_type)
            expect(json["skills"][0]["range"]).to eq(char.skills.first.range)
            expect(json["skills"][0]["description"]).to eq(char.skills.first.description)
        end
    end
end