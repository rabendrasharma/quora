class ApplicationController < ActionController::Base
  private
  def after_sign_in_path_for(resource)
    if current_user.subscribed_topics.present?
      root_path
    else
      new_topic_path
    end
  end
end
