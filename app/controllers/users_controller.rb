class UsersController < ApplicationController

	def new

	end

	def create

	end

	def show

	end

	def edit

	end

	def update

	end

	def destroy

	end
	
	private

	def user_params
		return params.require(:user).permit(:name, :password)
	end

end
