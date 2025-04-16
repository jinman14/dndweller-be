require "rails_helper"

RSpec.describe Skill, type: :model do
    describe "relationships" do
        it { should have_many :character_skills }
        it { should have_many(:characters).through :character_skills }
    end
end