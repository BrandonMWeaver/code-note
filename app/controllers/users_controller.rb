class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to user_path(@user.slug)
		else
			render :new
		end
	end

	def show
		@user = User.find_by_slug(params[:slug])
	end

	def edit

	end

	def update

	end

	def destroy

	end
	
	private

	def user_params
		return params.require(:user).permit(:username, :password)
	end

end
