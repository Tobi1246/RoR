class FeedbacksController < ApplicationController
  def new
    @feedback = current_user.feedbacks.new
  end

  def create
    @feedback = current_user.feedbacks.build(feedback_params)
    if @feedback.save
      FeedbackMailer.feedback(@feedback).deliver_later
      redirect_to root_path, success: 'Feedback sent!'
    else
      render :new, alert: 'FALURE sent!'
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :body)
  end
end
