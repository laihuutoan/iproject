class UserMailer < ApplicationMailer
  def welcome_email user
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def new_post_email recipients
    @recipients = recipients
    @url  = 'http://example.com/login'
    mail(to: recipients.map(&:email).uniq, subject: 'Welcome to My Awesome Site')
  end
end
