class Character < ApplicationRecord
    belongs_to :user
    has_many :character_skills, dependent: :destroy
    has_many :character_equipments, dependent: :destroy
    has_many :character_languages, dependent: :destroy
    has_many :skills, through: :character_skills
    has_many :equipments, through: :character_equipments
    has_many :languages, through: :character_languages

    after_save :update_searchable_column

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

    def update_searchable_column
        self.class.reindex_searchable(self)
    end

    def link_languages(languages)
        languages.each do |language|
            language_record = Language.where(language: language)
            
            if language_record.empty?
                self.languages.create!(language:language) 
            else
                CharacterLanguage.create!(character: self, language: language_record[0])
            end
        end
        # binding.pry
    end

    def link_equipment(equipments)
        equipments.each do |equipment|
            equipment_record = Equipment.where(name:equipment[:name])

            if equipment_record.empty?
                self.equipments.create!(
                        name: equipment[:name],
                        damage_dice: equipment[:damage_dice],
                        damage_type: equipment[:damage_type],
                        range: equipment[:range],
                        base_ac: equipment[:base],
                        dex_bonus: equipment[:dex_bonus],
                        equipment_type: equipment[:damage_dice] ? "weapon" : "armor")
            else
                CharacterEquipment.create(character:self, equipment:equipment_record[0])
            end
        end
    end
        
    def self.reindex_searchable(*records)
        where(id: records.map(&:id)).update_all(
            "searchable = to_tsvector('english', coalesce(name, '') || ' ' || coalesce(class_name, '') || ' ' || coalesce(race, '') || ' ' || coalesce(gender, ''))"
        )
    end
end