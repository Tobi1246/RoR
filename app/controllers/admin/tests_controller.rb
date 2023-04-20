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
    @test = current_user.created_tests.build(tests_params)
    if @test.save
      redirect_to admin_tests_path(@test), success: t('.success')
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, alert: t('.alert')
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def tests_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
