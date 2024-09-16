require 'pry'

class Api::V1::UsersController < Api::BaseController
    protect_from_forgery with: :null_session

    def show
    end

    def create 
    end

    private

    def user_login_params
        params.require(:userData).permit(:first_name, :last_name, :email, :auth_id, :role)
    end
end