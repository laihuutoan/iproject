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

  def after_sign_in_path_for(resource)
    byebug
    session["#{resource}_return_to"] || session["user_return_to"] || stored_location_for(:user) || root_url
  end
end
