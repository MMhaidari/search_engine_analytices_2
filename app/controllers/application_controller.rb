class ApplicationController < ActionController::Base
  helper_method :current_user 

  protected

  def current_user
    @current_user ||= User.find_or_create_by(user_ip: request.remote_ip)
  end
end