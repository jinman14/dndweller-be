FactoryBot.define do
    factory :character_skill do
        association :character
        association :skill
    end
end