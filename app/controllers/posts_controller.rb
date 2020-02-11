class PostsController < ApplicationController

	def index
		if params[:slug].present?
			@user = User.find_by_slug(params[:slug])
			@posts = @user.posts
		else
			@posts = Post.all
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
		if @post.validate
			@post.content = params[:post][:content].gsub!("\s", "&nbsp;")
			@post.save
			redirect_to users_posts_path(@post.user.slug)
		else
			render :new
		end
	end

	private

	def post_params
		return params.require(:post).permit(:title, :content, :description, :user_id, :language_id)
	end

end
