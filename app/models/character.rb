class Character < ApplicationRecord
    belongs_to :user
    has_many :character_skills
    has_many :character_equipments
    has_many :skills, through: :character_skills
    has_many :equipments, through: :character_equipments
end