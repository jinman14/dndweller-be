class Character < ApplicationRecord
    belongs_to :user
    has_many :character_skills
    has_many :character_equipments
    has_many :character_languages
    has_many :skills, through: :character_skills
    has_many :equipments, through: :character_equipments
    has_many :languages, through: :character_languages

    def speed
        if RaceStat.where(:name => self.race.downcase).empty?
            RaceStat.create!(name: self.race.downcase, speed: CharacterGateway.fetch_speed(self.race.downcase))
        end
        RaceStat.where(:name => self.race.downcase)[0].speed
    end
end