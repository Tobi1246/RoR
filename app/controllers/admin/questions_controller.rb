class Admin::QuestionsController < Admin::BaseController
  
  before_action :find_question, only: %i[destroy show edit update]
  before_action :find_test, only: %i[create new]

  def show; end

  def edit; end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to admin_question_path(@question), notice: 'Your create question!'
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test), alert: "Question has bin deleted"
  end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      render :edit
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title)
  end
end
