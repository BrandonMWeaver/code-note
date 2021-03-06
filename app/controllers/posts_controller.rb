class PostsController < ApplicationController

	before_action :find_post, only: [:edit, :update, :destroy]
	
	def index
		if params[:keyword].present?
			@posts = Post.search_for(params[:keyword])
		else
			if params[:language_slug].present?
				language = Language.find_by_slug(params[:language_slug])
			end
			if params[:slug].present?
				@user = User.find_by_slug(params[:slug])
				if language
					@posts = @user.posts.find_by_language(language).reverse
				else
					@posts = @user.posts.reverse
				end
			elsif language
				@posts = Post.find_by_language(language).reverse
			else
				@posts = Post.all.reverse
			end
		end
	end

	def new
		@post = Post.new(user_id: User.find_by_slug(params[:slug]).id)
		Language.populate
		unless logged_in? && @post.user == current_user
			redirect_to users_posts_path(@post.user.slug)
		end
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user
		if @post.user == current_user && @post.save
			redirect_to users_posts_path(@post.user.slug)
		else
			render :new
		end
	end

	def edit
		unless logged_in? && @post.user == current_user
			redirect_to root_path
		end
	end

	def update
		if @post.user == current_user && @post.update(post_params)
			redirect_to users_posts_path(@post.user.slug)
		else
			render :edit
		end
	end

	def destroy
		if @post.user == current_user
			@post.delete
		end
		redirect_to user_path(current_user.slug)
	end

	private

	def post_params
		return params.require(:post).permit(:title, :content, :description, :user_id, :language_id)
	end

end
