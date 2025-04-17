require "rails_helper"

RSpec.describe Language, type: :model do
    describe "relationships" do
        it { should have_many :character_languages }
        it { should have_many(:characters).through :character_languages }
    end
end