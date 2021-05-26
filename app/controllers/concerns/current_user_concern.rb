# module CurrentUserConcern
#   extend ActiveSupport::Concern

#   included do
#     before_action :login!, :logged_in?, :current_user, :authorized_user?, :logout!, :set_user
#   end

#   def login!
#     byebug
#     session[:user_id] = @user.id
#   end

#   def logged_in?
#     !!session[:user_id]
#   end

#   def current_user
#     @current_user ||= User.find(session[:user_id]) if session[:user_id]
#   end

#   def authorized_user?
#     @user == current_user
#   end

#   def logout!
#     session.clear
#   end

#   def set_user
#     @user = User.find_by(id: session[:user_id])
#   end
# end
