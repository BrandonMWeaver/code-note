class UsersController < ApplicationController

	before_action :find_user, only: [:show, :edit, :update, :destroy]

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

	end

	def edit
		unless logged_in? && @user == current_user
			redirect_to root_path
		end
	end

	def update
		if @user == current_user && @user.update(user_params)
			redirect_to user_path(@user.slug)
		else
			render :edit
		end
	end

	def destroy
		if @user == current_user
			session.delete :user_id
			@user.posts.each do |post|
				post.delete
			end
			@user.delete
		end
		redirect_to root_path
	end
	
	private

	def user_params
		return params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end

end
