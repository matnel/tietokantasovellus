class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :current_user

  def current_user
	@current_user = User.find(session[:current_user]) if session[:current_user]
  end

end
