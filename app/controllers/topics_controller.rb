class TopicsController < ApplicationController
  before_action :authenticate_user!
  def new
    @topics = Topic.all
  end

  def create
    if params[:topic].present?
      params[:topic].keys.each do |topic_id|
        user_topic = UserTopic.find_or_initialize_by(topic_id: topic_id.to_i, user_id: current_user.id)
        user_topic.save
      end
      redirect_to root_path
    end
  end

  def follow_topics
    @topics = Topic.all
    @user_topics = current_user.user_topics.group_by(&:topic_id)
  end
end
