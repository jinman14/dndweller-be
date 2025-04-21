require "rails_helper"

RSpec.describe Character, type: :model do
    describe "relationships" do
        it { should belong_to :user }
        it { should have_many :character_skills }
        it { should have_many :character_equipments }
        it { should have_many :character_languages }
        it { should have_many(:skills).through :character_skills }
        it { should have_many(:equipments).through :character_equipments }
        it { should have_many(:languages).through :character_languages }
    end

    describe "instance methods" do
        before(:each) do
            @char = create(:character)
        end

        describe "#mapLanguages" do
            it "Can return an array of language names" do
                lang = create(:language)
                create(:character_language, character: @char, language: lang)

                expect(@char.mapLanguages).to eq(["common"])
            end
        end

        describe "#proficiency" do
            it "Can return the proficiency bonus of a character based on level" do
                expect(@char.proficiency).to eq(2)
            end
        end

        describe "#serialize_equipment" do
            it "Can serialize all equipment for a given character" do
                sword = create(:sword)
                armor = create(:armor)
                [sword, armor].each do |equipment|
                    create(:character_equipment, character: @char, equipment: equipment)
                end
                
                expect(@char.serialize_equipment).to eq(
                    [
                        {
                            name: "Longsword",
                            damage_dice: "1d8",
                            damage_type: "slashing",
                            range: 5
                        },
                        {
                            name: "Leather-armor",
                            dex_bonus: true,
                            base_ac: 11
                        }
                    ]
                )
            end
        end

        describe "#serialize_skills" do
            it "Can return a serialized list of skills for a character" do
                arrow = create(:skill)
                create(:character_skill, character: @char, skill: arrow)
                
                expect(@char.serialize_skills).to eq(
                    [
                        {
                            name: "Acid-Arrow",
                            level: 2,
                            damage_type: "acid",
                            range: "90 feet",
                            description: "A shimmering green arrow streaks toward a target within range and bursts in a spray of acid. Make a ranged spell attack against the target. On a hit, the target takes 4d4 acid damage immediately and 2d4 acid damage at the end of its next turn. On a miss, the arrow splashes the target with acid for half as much of the initial damage and no damage at the end of its next turn."
                        }
                    ]
                )
            end
        end

        describe "#link_languages" do
            it "can create a link to a language" do
                char = create(:character)
                common = create(:language)

                char.link_languages(["common"])

                expect(char.languages).to include(common)
                expect(Language.all.length).to eq(1)
            end

            it "can create a language if one is not already recorded" do
                char = create(:character)

                char.link_languages(["common"])

                expect(char.languages).to include(Language.where(language:"common").first)
                expect(Language.all.length).to eq(1)
            end
        end

        describe "#link_equipment" do
            it "can create a link to a piece of equipment" do
                char = create(:character)
                sword = create(:sword)
                armor = create(:armor)

                char.link_equipment([{
                    name: "Longsword",
                    damage_dice: "1d8",
                    damage_type: "slashing",
                    range: 5
                },
                {
                    name: "Leather-armor",
                    base: 11,
                    dex_bonus: true
                }
                ]) 

                expect(char.equipments.pluck("name")).to eq(["Longsword", "Leather-armor"])
                expect(Equipment.all.length).to eq(2)
                expect(Equipment.first.equipment_type).to eq("weapon")
            end

            it "can create records for equipment that does not yet exist" do
                char = create(:character)

                char.link_equipment([{
                    name: "Longsword",
                    damage_dice: "1d8",
                    damage_type: "slashing",
                    range: 5
                },
                {
                    name: "Leather-armor",
                    base: 11,
                    dex_bonus: true
                }
                ]) 

                expect(char.equipments.pluck("name")).to eq(["Longsword", "Leather-armor"])
                expect(Equipment.all.length).to eq(2)
                expect(Equipment.first.equipment_type).to eq("weapon")
            end
        end
    end
end