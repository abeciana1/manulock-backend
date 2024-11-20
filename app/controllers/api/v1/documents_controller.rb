require 'pry'

class Api::V1::DocumentsController < Api::BaseController
    protect_from_forgery with: :null_session

    # def index
    # end

    def show
        binding.pry
        render json: { document: DocumentSerializer.new(@document) }, status: :ok 
    end

    def create
        render json: { document: DocumentSerializer.new(@document) }, status: :ok 
    end

    private

    def document_params
        params.require(:document).permit(:title, :hosted_url, :owner_id, :created_at, :updated_at, :owner_id)
    end

end