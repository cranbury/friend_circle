class UserMailer < ActionMailer::Base
  default from: "from@example.com"


  def welcome_email(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: user.email, subject: 'Welcome to my site')
  end

  def forgot_password(user)
    @user = user
    @url = edit_user_url
    mail(to: user.email, subject: 'Dolphins.com password reset')
  end
end
