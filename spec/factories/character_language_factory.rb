FactoryBot.define do
    factory :character_language do
        association :character
        association :language
    end
end