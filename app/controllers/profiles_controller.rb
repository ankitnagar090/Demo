class ProfilesController < ApplicationController
	def index
		@user = current_user
    @posts = @user.posts.all	
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update   
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to profiles_path
    else
      render :index
    end
  end

  private
    def user_params
      params.require(:user).permit(:user_name, :full_name, :bio, :profile_photo) 
    end
end
