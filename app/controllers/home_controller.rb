class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @questions = Question.where(id: QuestionTopic.where(topic_id: current_user.subscribed_topics.map(&:id)).map(&:question_id)).includes(:answers)
  end
end
