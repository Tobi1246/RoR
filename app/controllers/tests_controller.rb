class TestsController < ApplicationController

  before_action :find_test, only: %i[show start]

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(tests_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test), success: "Your started test"
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def tests_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
