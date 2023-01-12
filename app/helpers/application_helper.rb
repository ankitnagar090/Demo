module ApplicationHelper
	def find_like(comment, user)
    comment.likes.find { |like| like.user_id == user}
  end
end
