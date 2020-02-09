class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user.slug)
		else
			render :new
		end
	end

	def show
		@user = User.find_by_slug(params[:slug])
	end

	def edit
		@user = User.find_by_slug(params[:slug])
		unless logged_in? && @user == current_user
			redirect_to root_path
		end
	end

	def update
		@user = current_user
		if params[:user][:username].present? && params[:user][:password].size >= 5
			@user.update(user_params)
			redirect_to user_path(@user.slug)
		else
			render :edit
		end
	end

	def destroy

	end
	
	private

	def user_params
		return params.require(:user).permit(:username, :password, :password_confirmation)
	end

end
