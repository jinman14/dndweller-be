class CharacterSerializer
  def self.format_character_list(characters)
    {
      data: characters.map do |character|
        {
          id: character.id.to_s,
          type: "character",
          attributes: {
            token_url: character.token_url,
            character_name: character.name,
            class: character.class_name,
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
end