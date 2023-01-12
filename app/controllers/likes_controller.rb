class LikesController < ApplicationController
	before_action :authenticate_user! 
	def create
		if params[:post_id].present? && params[:comment_id].present?
	    @comment = Comment.find(params[:comment_id])
	    @like = @comment.likes.create(user_id: current_user.id)
	    if @like.save
	      redirect_to post_comments_path 
	    else
	      flash.now[:danger] = "error"
	    end
	  else
	    @post = Post.find(params[:post_id])
	    @like = @post.likes.create(user_id: current_user.id) 
	    if @like.save
	      redirect_to posts_path 
	    else
	      flash.now[:danger] = "error"
	    end
	  end   
	end	  

	def destroy
		if params[:comment_id].present?
			@comment = Comment.find(params[:comment_id])
		  @like = @comment.likes.find(params[:id])
		  @like.destroy
		  redirect_to post_comments_path 
	  else
	  	@post = Post.find(params[:post_id])
		  @like = @post.likes.find(params[:id])
		  @like.destroy
		  redirect_to post_path 
	  end	 
	end
		  	    
	private
	  def already_liked?
		  Like.where(user_id: current_user.id, likeable_id:
		  params[:post_id]).exists?
	  end
end
