require "rails_helper"

RSpec.describe Character, type: :model do
    describe "relationships" do
        it { should belong_to :user }
        it { should have_many :character_skills }
        it { should have_many :character_equipments }
        it { should have_many(:skills).through :character_skills }
        it { should have_many(:equipments).through :character_equipments }
    end
end