class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

    private

    def not_found_response(exception)
        # binding.pry
        render json: {message: "Could not find #{exception.model} with id #{exception.id}", status: 404}, status: :not_found
    end
end
