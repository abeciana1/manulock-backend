class Api::BaseController < ActionController::Base
    def set_include_fields
        @include_fields = params[:fields].present? ? params[:fields].split(",") : []
    end
end