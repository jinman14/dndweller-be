class Api::V1::CharactersController < ApplicationController
  def index
    characters = Character.all

    if params[:query].present?
      ts_query = params[:query].tr(" ", " &")
      characters = characters.where("searchable @@ plainto_tsquery('english', ?)", ts_query)
    end

    render json: CharacterSerializer.format_character_list(characters)
  end

  def show
    render json: CharacterSerializer.format_character_data( Character.find(params[:id]))
  end

  def destroy
    character = Character.find_by(id: params[:id])

    if character
      character.destroy
      render json: { message: "Character deleted" }, status: :ok
    else
      render json: { error: "Character not found" }, status: :not_found
    end
  end

  def create 
    char_p = character_params
    char = Character.create!(
      user_id: char_p[:user_id],
      str: char_p[:str],
      dex: char_p[:dex],
      int: char_p[:int],
      con: char_p[:con],
      wis: char_p[:wis],
      chr: char_p[:cha],
      name: char_p[:name],
      ac: char_p[:armor_class],
      level: char_p[:level],
      race: char_p[:race],
      class_name: char_p[:class],
      gender: char_p[:gender],
      token_url: char_p[:token],
      speed: char_p[:speed],
      hp: char_p[:hp]
    )

    char.link_languages(params[:languages])
    char.link_equipment(params[:equipment])
    char.link_skills(params[:skills])

    render json: CharacterSerializer.format_character_data(char)
  end

  private

  def character_params
    params.permit(
      :token,
      :name,
      :level,
      :hp,
      :race,
      :class,
      :gender,
      :speed,
      :armor_class,
      :str,
      :dex,
      :con,
      :int,
      :wis,
      :cha,
      :user_id,
    )
  end
end