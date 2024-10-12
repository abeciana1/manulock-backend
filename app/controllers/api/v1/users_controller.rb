require 'pry'

class Api::V1::UsersController < Api::BaseController
    protect_from_forgery with: :null_session

    def show
        render json: { user: UserSerializer.new(@current_user) }, status: :ok
    end

    def create
        render json: { user: UserSerializer.new(@current_user) }, status: :ok
    end

    def my_documents
        binding.pry
    end

    private

    def user_login_params
        params.require(:user).permit(:first_name, :last_name, :email, :auth_id, :role)
    end
end