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
end