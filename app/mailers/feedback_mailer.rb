class FeedbackMailer < ApplicationMailer
  def feedback(feedback)
    @feedback = feedback
    @admin = User.find_by(type: 'Admin')

    mail to: @admin.email,from: @feedback.user.email, subject: 'Feedback'
  end  
end
