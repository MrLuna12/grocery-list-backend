module Api
  module V1
    class BaseController < ApplicationController
      before_action :authenticate_user!
      respond_to :json

      private

      def authenticate_user!
        token = request.headers['Authorization']&.split(' ')&.last
        return unauthorized unless token

        begin
          decoded_token = JWT.decode(token, Rails.application.credentials.secret_key_base, true, algorithm: 'HS256')
          @current_user = User.find(decoded_token[0]['user_id'])
        rescue JWT::DecodeError, ActiveRecord::RecordNotFound
          unauthorized
        end
      end

      def current_user
        @current_user
      end

      def unauthorized
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end
  end
end
