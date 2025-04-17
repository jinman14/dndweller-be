class CharacterSerializer
    def self.format_character_data(char)
        {
            data: {
                id: char.id,
                token_url: char.token_url,
                character_name: char.name,
                level: char.level,
                race: char.race,
                class: char.class_name,
                gender: char.gender,
                speed: char.speed,
                languages: char.mapLanguages,
                proficiency: char.proficiency,
                armor_class: char.ac,
                statistics: {
                    str: char.str,
                    dex: char.dex,
                    con: char.con,
                    int: char.int,
                    wis: char.wis,
                    cha: char.chr
                },
                equipment: char.serialize_equipment,
                skills: char.serialize_skills
            }
        }
    end
end