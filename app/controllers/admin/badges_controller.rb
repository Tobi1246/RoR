class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[destroy edit update]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def edit; end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path, notice: 'Your create badge!'
    else
      render :new
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, alert: t('.alert')
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :img, :user_id)
  end
end
