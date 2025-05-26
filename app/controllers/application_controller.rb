class ApplicationController < ActionController::API
  allow_browser versions: :modern
  before_action :authenticate_request

  attr_reader :current_user

  private

  def authenticate_request
    return render_unauthorized('Missing token') unless auth_header_present?
    return render_unauthorized('Invalid token') unless token_valid?

    set_current_user
    render_unauthorized('User not found') unless @current_user
  end

  def auth_header_present?
    request.headers['Authorization'].present?
  end

  def token_valid?
    @decoded_token = JwtService.decode(extract_token)
    @decoded_token.present?
  end

  def extract_token
    request.headers['Authorization'].split(' ').last
  end

  def set_current_user
    @current_user = User.find_by(id: @decoded_token[:user_id]) if @decoded_token
  end

  def render_unauthorized(message)
    render json: { error: message }, status: :unauthorized
  end
end
