class Api::V1::CharactersController < ApplicationController
  def index
    characters = Character.all
    
    render json: CharacterSerializer.format_character_list(characters)
  end

  def show
    
  end
end