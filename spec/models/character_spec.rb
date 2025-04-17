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
        describe "#speed" do
            it "Can return the speed of a character and add it to race stats lookup table", :vcr do
                char = create(:character)
                expect(char.speed).to eq(30)
                expect(RaceStat.where(name:"human").pluck("speed")[0]).to eq(30)
            end
        end

        describe "#mapLanguages" do
            it "Can return an array of language names" do
                char = create(:character)
                lang = create(:language)
                create(:character_language, character: char, language: lang)

                expect(char.mapLanguages).to eq(["common"])
            end
        end
    end
end