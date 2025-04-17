FactoryBot.define do 
  factory :character do
    name {'Jarisemosha'}
    level {3}
    race {"Human"}
    class_name {"Bard"}
    str {10}
    dex {10}
    con {10}
    int {10}
    wis {10}
    cha {10}
    ac {11}
    gender {"male"}
    token_url {"url"}
  end
end