FactoryBot.define do
    factory :character_equipment do
        association :character
        association :equipment
    end
end