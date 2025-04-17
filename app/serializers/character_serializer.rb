class CharacterSerializer
<<<<<<< HEAD
  def self.format_character_list(characters)
    {
      data: characters.map do |character|
        {
          id: character.id.to_s,
          type: "character",
          attributes: {
            token_url: character.token_url,
            character_name: character.name,
            class_name: character.class_name,
            race: character.race,
            gender: character.gender,
            level: character.level,
            creator_name: character.user.name
          }
        }
      end,
      character_count: characters.size
    }
  end
=======
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
>>>>>>> main
end