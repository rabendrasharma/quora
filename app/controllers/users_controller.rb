class UsersController < ApplicationController
  def my_topics
    @topics = current_user.subscribed_topics
  end
end
