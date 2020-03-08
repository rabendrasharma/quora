class FollowsController < ApplicationController
  before_action :authenticate_user!

  def follow
    follow = Follow.find_or_initialize_by(follower_id: current_user.id, followee_id: params[:followee_id])
    redirect_to root_path if follow.save
  end

  def unfollow
    Follow.where(follower_id: current_user.id, followee_id: params[:followee_id]).delete_all
    redirect_to root_path
  end

  def followings
    follows = Follow.where(follower_id: current_user.id, followee_id: params[:followee_id])
    @users = User.where(followee_id: follows.map(&:followee_id)).map(&:email) if follows.present?
  end
end
