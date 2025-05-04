module Api
  module V1
    class AuthController < ApplicationController
      skip_before_action :verify_authenticity_token
      respond_to :json

      def create
        user = User.find_by(email: params[:email])

        if user&.valid_password?(params[:password])
          token = generate_token(user)
          render json: {
            user: UserSerializer.new(user),
            token: token
          }
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end

      private

      def generate_token(user)
        payload = { user_id: user.id }
        JWT.encode(payload, Rails.application.credentials.secret_key_base, 'HS256')
      end
    end
  end
end
