class PostsController < ApplicationController
	#before_action :authenticate_user! 
	
	def index
		if params[:search_key].present?
			#@posts = Post.all.select{ |p| p.description.downcase.match(params[:search_key].downcase) || p.user.user_name.downcase.match(params[:search_key].downcase)}
			@user = User.find_by("user_name = ?", params[:search_key])
			if @user.nil?
        redirect_to posts_path
      else
    	  @posts = @user.posts
    	  @shareds = @user.shareds
        @search = true
        @content = {
        post: @posts,
        shared: @shareds,        
        }
                
      end  
		else
		  #@posts = Post.all.select{ |p| p.user.id != current_user.id && (p.status != "unpublished" || check(p.user.id))}
		  #@shareds = Shared.all.select{ |s| s.user.id != current_user.id && (s.post.status != "unpublished" || check(s.post.user.id))}
		  @search = false
      @posts = Post.all 
      @shareds = Shared.all
      @content = {
       post: @posts,
       shared: @shareds,
       
      }
    end  
      
    
		  respond_to do |format|
        format.json { render json: @content} 
        format.html { render layout: true } # or whatever to simply render html   
      end
    
	end
	
  def new
 	  @post =Post.new
  end

  def create    
    @post = current_user.posts.build(post_params)     
    if @post.save 
      redirect_to posts_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:post_file, :description, :user_id, :status) 
  end

  def check(follower_id)
    @followees = current_user.followees
    @followees.each do |follower|
      if follower.id == follower_id
      	return true
      end	
    end
    return false
	end
end
