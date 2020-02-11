class StaticController < ApplicationController

	def home
		@posts = Post.all.reverse.take(5)
	end
	
end
