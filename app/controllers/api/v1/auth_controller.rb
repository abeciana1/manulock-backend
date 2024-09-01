require 'pry'

class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        binding.pry
    end

    private

    def user_login_params
        params.require(:userData).permit(:email)
    end
end