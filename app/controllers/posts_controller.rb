class PostsController < ApplicationController

	def index
		if params[:slug].present?
			@user = User.find_by_slug(params[:slug])
			@posts = @user.posts.reverse
		else
			@posts = Post.all.reverse
		end
	end

	def new
		@post = Post.new(user_id: User.find_by_slug(params[:slug]).id)
		unless logged_in? && @post.user == current_user
			redirect_to users_posts_path(@post.user.slug)
		end
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user
		if @post.save
			redirect_to users_posts_path(@post.user.slug)
		else
			render :new
		end
	end

	def edit
		@post = Post.find_by_id(params[:id])
		unless logged_in? && @post.user == current_user
			redirect_to root_path
		end
	end

	def update
		@post = Post.find_by_id(params[:id])
		if @post.update(post_params)
			redirect_to users_posts_path(@post.user.slug)
		else
			render :edit
		end
	end

	private

	def post_params
		return params.require(:post).permit(:title, :content, :description, :user_id, :language_id)
	end

end
