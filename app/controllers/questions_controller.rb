class QuestionsController < ApplicationController
  before_action :authenticate_user!
  def new
    @topics = current_user.subscribed_topics
  end

  def create
    question = Question.new(question: params[:question], user_id: current_user.id)
    if question.save
      QuestionTopic.create(topic_id: params[:topic_id].to_i, question_id: question.id)
    end
    redirect_to root_path
  end

  def index
    @questions = current_user.questions
  end
end
