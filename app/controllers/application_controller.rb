class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user
  def authenticate_user
  	if session[:user_id].blank?
  		redirect_to root_path
  	end
  end
  helper_method :current_user
  def current_user
    true if not session[:user_id].blank?
  end
end
