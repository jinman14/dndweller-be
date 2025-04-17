class SkillSerializer
    def self.format_skills(skill)
        {
            data: {
                name: skill.name,
                level: skill.level.to_i,
                damage_type: skill.damage_type,
                range: skill.range,
                description: skill.description
            }
        }
    end
end