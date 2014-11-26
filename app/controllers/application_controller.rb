class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate
  after_action :set_access_control_headers

  private

  def authenticate
    @current_user = User.find_by(:id => session[:user_id])
    session[:user_id] = nil unless @current_user.present?
  end

  def set_access_control_headers
   headers['Access-Control-Allow-Origin'] = "http://localhost:3000"
   headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
 end
end
