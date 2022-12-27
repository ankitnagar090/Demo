class PostsController < ApplicationController
		before_action :authenticate_user!
		def index
			@posts = Post.all
      @searchs = {searched_records: true}
		end
		
		def show
	    @post = Post.find(params[:id])
    end

    def new
   	  @post =Post.new
    end

	  def create    
	    @post = current_user.posts.build(post_params)     
	    if @post.save 
	      redirect_to show_post_path(@post)
	    else
	    	puts @post.errors
	      render :new, status: :unprocessable_entity
	    end
	  end

	  def profile
      @user = current_user
    end

    def search     
      @posts = Post.all.select{ |p| p.description.downcase.match(params[:s_key].downcase) || p.user.user_name.downcase.match(params[:s_key].downcase)}
      @searchs = {searched_records: false}
    end

    
	  private
    def post_params
      params.require(:post).permit(:post_file, :video, :description, :user_id) 
    end
	
end
