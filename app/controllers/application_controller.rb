class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :authenticate_user!, if: :authenticate_admin?
  before_action :new_subscriber

  def new_subscriber
    @subscriber = Subscriber.new
  end

  def authenticate_admin?
    self.class.parent == Admin
  end
end
