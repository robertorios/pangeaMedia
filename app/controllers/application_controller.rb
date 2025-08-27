class ApplicationController < ActionController::API
    # before_action :authorize_request

    # attr_reader :current_user

    # private

    # def authorize_request
    #     header = request.headers['Authorization']
    #     token = header.split(' ').last if header

    #     begin
    #     decoded = JWT.decode(token, jwt_secret, true, { algorithm: 'HS256' })
    #     @current_user = decoded[0]['user_id']
    #     rescue JWT::DecodeError => e
    #     render json: { error: 'Unauthorized', message: e.message }, status: :unauthorized
    #     end
    # end

    # def jwt_secret
    #     ENV['JWT_SECRET'] || Rails.application.credentials.jwt_secret
    # end
end
