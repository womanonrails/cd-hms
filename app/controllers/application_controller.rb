class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def new_session_path(_scope)
    new_user_session_path
  end

  protected

  def authenticate_with_token
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, _options|
      token == Rails.application.secrets.token
    end
  end

  def render_unauthorized
    render json: { errors: 'Bad credentials' }, status: 401
  end
end
