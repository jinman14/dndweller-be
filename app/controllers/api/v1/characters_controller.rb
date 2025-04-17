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
end