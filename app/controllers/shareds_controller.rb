class SharedsController < ApplicationController
	def index
		@user = User.find(params[:user_id]) 
    @shareds = @user.shareds		
  end

	def create   
	  @post = Post.find(params[:post_id]) 
    @shared = current_user.shareds.create(post_id: @post.id)     
    if @shared.save 
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
	end
end
