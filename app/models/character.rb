class Character < ApplicationRecord
    belongs_to :user
    has_many :character_skills
    has_many :character_equipments
    has_many :character_languages
    has_many :skills, through: :character_skills
    has_many :equipments, through: :character_equipments
    has_many :languages, through: :character_languages

    def mapLanguages
        self.languages.pluck("language")
    end

    def proficiency
        return ((self.level.to_f) / 4).ceil + 1
    end

    def serialize_equipment
        return self.equipments.map { |equipment| EquipmentSerializer.format_equipment(equipment)[:data] }
    end

    def serialize_skills
        return self.skills.map { |skill| SkillSerializer.format_skills(skill)[:data] }
    end
end