require "rails_helper"

RSpec.describe CharacterSkill, type: :model do
    describe "relationships" do
        it { should belong_to :character }
        it { should belong_to :skill }
    end
end