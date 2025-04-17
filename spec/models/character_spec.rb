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

        describe "#speed" do
            it "Can return the speed of a character and add it to race stats lookup table", :vcr do
                expect(@char.speed).to eq(30)
                expect(RaceStat.where(name:"human").pluck("speed")[0]).to eq(30)
            end
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
    end
end