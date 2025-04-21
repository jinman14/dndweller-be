class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

    private

    def not_found_response(exception)
        # binding.pry
        render json: {message: "Could not find #{exception.model} with id #{exception.id}", status: 404}, status: :not_found
    end
end
