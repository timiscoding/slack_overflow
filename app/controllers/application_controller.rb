class ApplicationController < ActionController::Base
  before_action :current_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def current_user
    if session[:user_id].present?
      @current_user = User.find_by(:id => session[:user_id])
      session[:user_id] = nil if @current_user.nil?
    end
  end
end
