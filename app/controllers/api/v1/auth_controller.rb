module Api
  module V1
    class AuthController < ApplicationController
      skip_before_action :authenticate_request, only: [ :login, :register ]

      # POST /api/v1/auth/register
      def register
        user = User.new(user_params)

        if user.save
          auth_token = JwtService.encode(user_id: user.id)
          render json: {
            message: 'Account created successfully',
            user: UserSerializer.new(user),
            token: auth_token
          }, status: :created
        else
          render json: {
            errors: user.errors.full_messages
          }, status: :unprocessable_entity
        end
      end

      # POST /api/v1/auth/login
      def login
        user = User.find_by(email: params[:email])

        if user&.authenticate(params[:password])
          auth_token = JwtService.encode(user_id: user.id)
          render json: {
            user: UserSerializer.new(user),
            token: auth_token
          }, status: :ok
        else
          render json: {
            error: 'Invalid email or password'
          }, status: :unauthorized
        end
      end

      private

      def user_params
        params.permit(:email, :password, :password_confirmation)
      end
    end
  end
end
