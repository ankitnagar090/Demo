class CommentsController < ApplicationController
	def index
		@post = Post.find(params[:post_id])
		@comment = @post.comments		
  end
    
	def show
	  @post = Post.find(params[:id])

    end
  def new
   	@post = Post.find(params[:post_id])
   	@comment = @post.comments.new(parent_id: params[:parent_id])
  end

	def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_comments_path 
    else
      flash.now[:danger] = "error"
    end
  end
	def destroy
	    
	end

	def profile
    @user = current_user
  end

	private
  def comment_params
    params.require(:comment).permit(:post_id, :user_id, :content, :parent_id) 
  end
 
end
