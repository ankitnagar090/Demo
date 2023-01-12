class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

	def index
		@comment = @post.comments		
  end
    
	def show
	  @comment = @post.comments.find(params[:id])
  end

  def new
   	@comment = @post.comments.new(parent_id: params[:parent_id])
  end

	def create
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_comments_path 
    else
      flash.now[:danger] = "error"
    end
  end
  
	private
  def set_post
    @post = Post.find(params[:post_id])
  end  
  def comment_params
    params.require(:comment).permit(:post_id, :user_id, :content, :parent_id) 
  end
 
end
