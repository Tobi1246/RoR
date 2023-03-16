class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

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

  private

  def tests_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
