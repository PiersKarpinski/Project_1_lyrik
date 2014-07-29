class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: "You can't access this page"
  end

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id])if session[:user_id]
  end

  def authenticate_user!
    unless current_user 
      redirect_to new_session_path, alert: "You need to be logged in to access this route"
    end
  end
end
