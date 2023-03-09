class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show, destroy]

  def index
    @question = Question.all
    @test = Test.find(params[:test_id])
  end

  def show

  end

  def new
    @question = Question.new
  end

  def create
    @test = Test.find(params[:test_id])
    @question = @test.questions.build(test_id: params[:test_id], title: params[:question][:title])
    if @question.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to root_path
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def quest_params
    params.permit(:test_id, question: [:title])
  end

end
