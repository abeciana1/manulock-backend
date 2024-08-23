require 'jwt'

class Api::BaseController < ActionController::Base
    before_action :authenticate_user!

    private

    def authenticate_user!
        auth_header = request.headers['Authorization']
        token = auth_header.split(' ').last if auth_header
        begin
            payload = JWT.decode(token, Rails.application.credentials[:clerk][:secret], true, algorithm: 'HS256')[0]
            @current_user = User.find_by(clerk_id: payload['sub'])
        rescue JWT::DecodeError, ActiveRecord::RecordNotFound
            render json: { error: 'Unauthorized' }, status: :unauthorized
        end
    end
end
