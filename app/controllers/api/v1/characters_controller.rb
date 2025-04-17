class Api::V1::CharactersController < ApplicationController
  def index
    
  end

  def show
    render json: CharacterSerializer.format_character_data( Character.find(params[:id]))
  end
end