require "rails_helper"

RSpec.describe CharacterEquipment, type: :model do
    describe "relationships" do
        it { should belong_to :character }
        it { should belong_to :equipment }
    end
end