class FollowsController < ApplicationController
  before_action :set_user
	def follow
    #current_user.followees << @user
    current_user.requested_users.create(requester_id: @user.id)
    redirect_to posts_path(search_key: @user.user_name)
	end	 

	def unfollow
	  current_user.followed_users.find_by(followee_id: @user.id).destroy
	  redirect_to posts_path(search_key: @user.user_name)
	end	 
 
	def accept
    #current_user.followees << @user
    @user.followed_users.create(followee_id: current_user.id)
    @user.requested_users.find_by(requester_id: current_user.id).destroy
    redirect_to profiles_path
	end	 

	def cancel
	  current_user.requested_users.find_by(requester_id: @user.id).destroy
	  redirect_to posts_path(search_key: @user.user_name)
	end

	def remove
	  @user.requested_users.find_by(requester_id: current_user.id).destroy
	  redirect_to profiles_path
	end	 

	def follower
		@follower = @user.followers
    render :follower
	end	 

	def following
		@following = @user.followees	  
	  render :following
	end	

  def requested
		@requester = @user.requesteds	  
	  render :showrequests
	end

	private
  def set_user
    @user = User.find(params[:user_id])
  end  

end
