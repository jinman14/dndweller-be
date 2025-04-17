class Api::V1::CharactersController < ApplicationController
  def index
    
  end

  def show
    render json: {data: [
      "test"
    ]}
  end
end