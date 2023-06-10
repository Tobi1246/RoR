class Admin::TestsController < Admin::BaseController
  before_action :set_tests, only: %i[index update_inline]
  before_action :find_test, only: %i[show destroy edit update update_inline]

  def index; end

  def show; end

  def edit; end

  def new
    @test = Test.new
  end

  def update
    if @test.update(tests_params)
      redirect_to [:admin, @test]
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(tests_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def create
    @test = current_user.created_tests.build(tests_params)
    if @test.save
      redirect_to admin_test_path(@test), success: t('.success')
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, alert: t('.alert')
  end

  private

  def set_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def tests_params
    params.require(:test).permit(:title, :level, :category_id, :timer)
  end
end
