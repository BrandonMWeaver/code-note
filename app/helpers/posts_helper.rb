module PostsHelper

	def conditional_link_to_for(post)
		if logged_in? && post.user == current_user
			link_to "Edit", edit_users_post_path(post.user.slug, post)
		else
			link_to post.user.username, user_path(post.user.slug)
		end
	end

end
