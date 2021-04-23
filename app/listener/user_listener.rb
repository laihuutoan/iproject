class UserListener
  def post_create(post)
    UserMailer.new_post_email(Subscriber.all).deliver_now
  end
end
