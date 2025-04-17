require "rails_helper"

RSpec.describe CharacterGateway do
    describe "#fetch_speed" do
        it "Should fetch the speed of a given race", :vcr do
            expect(CharacterGateway.fetch_speed("human")).to eq(30)
        end
    end
end