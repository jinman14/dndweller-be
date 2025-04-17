FactoryBot.define do
    factory :skill do
        name {"Acid-Arrow"}
        level { 2 }
        damage_type { "acid" }
        range { "90 feet" }
        description { "A shimmering green arrow streaks toward a target within range and bursts in a spray of acid. Make a ranged spell attack against the target. On a hit, the target takes 4d4 acid damage immediately and 2d4 acid damage at the end of its next turn. On a miss, the arrow splashes the target with acid for half as much of the initial damage and no damage at the end of its next turn." }
    end
end