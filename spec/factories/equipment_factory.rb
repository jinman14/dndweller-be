FactoryBot.define do
    factory :sword, class: :equipment do
        name { "Longsword" }
        equipment_type { "weapon" }
        damage_dice { "1d8" }
        damage_type { "slashing" }
        range { 5 }
        dex_bonus { nil }
        base_ac { nil }
    end

    factory :armor, class: :equipment do
        name { "Leather-armor" }
        equipment_type { "armor" }
        damage_dice { nil }
        damage_type { nil }
        range { nil }
        dex_bonus { true }
        base_ac { 11 }
    end
end