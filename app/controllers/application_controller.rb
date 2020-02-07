class ApplicationController < ActionController::Base
	helper_method :logged_in?, :current_user
	
	private

	def logged_in?
		return !!session[:user_id]
	end

	def current_user
		return @current_user ||= User.find_by_id(session[:user_id])
	end

end
