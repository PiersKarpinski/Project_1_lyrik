class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  # before_filter :can_access_route
  before_filter :set_ransack_form_variables

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: "You can't access this page"
  end
  
  def set_ransack_form_variables
    @q = Song.search(params[:q])
    @songs = @q.result(distinct: true)
  end

  def current_user
    @current_user ||= User.find(session[:user_id])if session[:user_id]
  end

  def authenticate_user!
    unless current_user 
      redirect_to new_session_path, alert: "You need to be logged in to access this route"
    end
  end
end


# private
# def can_access_route
#   raise 'Permissions rejected' unless authorized?(current_user, params[:controller], params[:action])
# end

# private
# def authorized?(user, controller, action)
#   case user.try(:role)
#     when "admin" then true
#     when "user"
#       case controller
#         when "secret" then false
#         when "gossip" then true
#       else 
#         true
#       end
#     else
#       true
#   end
# end