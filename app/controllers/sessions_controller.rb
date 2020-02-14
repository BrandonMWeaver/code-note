class SessionsController < ApplicationController

	def new
		
	end

	def create
		if auth
			@user = User.find_by(email: auth["info"]["email"])
			unless @user
				@user = User.new(username: auth["info"]["name"], email: auth["info"]["email"], password: SecureRandom.hex)
				if @user.save
					session[:user_id] = @user.id
					redirect_to user_path(@user.slug)
				else
					render :new
				end
			else
				session[:user_id] = @user.id
				redirect_to user_path(@user.slug)
			end
		else
			@user = User.find_by(username: params[:user][:username])
			if @user && @user.authenticate(params[:user][:password])
				session[:user_id] = @user.id
				redirect_to user_path(@user.slug)
			else
				render :new
			end
		end
	end

	def destroy
		session.delete :user_id
		redirect_to root_path
	end

	private

	def auth
		return request.env["omniauth.auth"]
	end

end
