require "rails_helper"

RSpec.describe Equipment, type: :model do
    describe "relationships" do
        it { should have_many :character_equipments }
        it { should have_many(:characters).through :character_equipments }
    end
end