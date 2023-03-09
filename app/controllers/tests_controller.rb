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
    redirect_to root_path if test = Test.create(tests_params)
  end

  private

  def tests_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
