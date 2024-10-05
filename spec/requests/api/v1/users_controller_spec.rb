require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
    let(:user_params) do
        {
            user: {
            first_name: 'John',
            last_name: 'Doe',
            email: 'john.doe@example.com',
            role: 'inviter'
            }
        }
    end

    describe "POST /api/v1/users" do
        context 'when Clerk-User-Id is present in headers' do
            let(:clerk_user_id) {'1234'}
    
            it "creates or finds the user and returns the user data" do
                post "/api/v1/users",
                    params: user_params,
                    headers: { 'Clerk-User-Id' => clerk_user_id }
                expect(response).to have_http_status(:ok)
                json_response = JSON.parse(response.body)
                expect(json_response['user']).not_to be_nil
                expect(json_response['user']['first_name']).to eq('John')
            end
        end

        context "when Clerk-User-Id is not present in headers" do
            it "returns an unauthorized error" do
                post "/api/v1/users",
                    params: user_params
                expect(response).to have_http_status(:unauthorized)
                json_response = JSON.parse(response.body)
                expect(json_response['error']).to eq('Auth header not found — unauthorized')
            end
        end
    end
end