class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: %i[show destroy]

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
      redirect_to admin_tests_path(@test)
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, alert: "Test has bin deleted"
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def tests_params
    params.require(:test).permit(:title, :level, :category_id).merge(author: current_user)
  end
end
