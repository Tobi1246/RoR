class TestsController < ApplicationController
  before_action :find_test, only: %i[show]
  
  def index
    @tests = Test.all
  end

  def show

  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(tests_params)
    if @test.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def tests_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
