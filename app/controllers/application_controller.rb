class ApplicationController < ActionController::Base
	helper_method :logged_in?, :current_user
	
	private

	def logged_in?
		return !!session[:user_id]
	end

	def current_user
		return @current_user ||= User.find_by_id(session[:user_id])
	end

	def find_user
		return @user = User.find_by_slug(params[:slug])
	end

	def find_post
		return @post = Post.find_by_id(params[:id])
	end

end
