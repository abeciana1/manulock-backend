require 'pry'

module Authentication
    extend ActiveSupport::Concern

    included do
        before_action :authenticate_user_from_clerk
    end

    private

    def authenticate_user_from_clerk
        clerk_user_id = request.headers['Clerk-User-Id']
        if clerk_user_id.present?
            @current_user = User.find_or_create_by(auth_id: clerk_user_id) do |user|
                # user.first_name = user_login_params[:first_name]
                # user.last_name = user_login_params[:last_name]
                # user.email = user_login_params[:email]
                user.first_name = params[:user][:first_name] if params[:user].present?
                user.last_name = params[:user][:last_name] if params[:user].present?
                user.email = params[:user][:email] if params[:user].present?
                user.role = "inviter"
            end
            return @current_user
        else
            render json: { error: 'Auth header not found — unauthorized' }, status: :unauthorized
        end
    end
end