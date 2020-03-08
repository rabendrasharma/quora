class AnswersController < ApplicationController
  before_action :authenticate_user!
  
  def new;end
  
  def create
    answer = Answer.new(answer: params[:answer], question_id: params[:question_id], user_id: current_user.id)
    redirect_to root_path if answer.save
  end

  def index
    @answers = current_user.answers
  end
end
