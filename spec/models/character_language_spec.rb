require "rails_helper"

RSpec.describe CharacterLanguage, type: :model do
    describe "relationships" do
        it { should belong_to :character }
        it { should belong_to :language }
    end
end