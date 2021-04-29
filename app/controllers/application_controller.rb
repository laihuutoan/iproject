class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :authenticate_user!, if: :authenticate_admin?
  before_action :new_subscriber, :set_page

  def new_subscriber
    @subscriber = Subscriber.new
  end

  def authenticate_admin?
    self.class.parent == Admin
  end

  def after_sign_in_path_for resource
    session[:return_to] || root_url
  end

  protected

  def set_page
    unless request.referer.nil? || request.referer.include?('/users/sign')
      session[:return_to] = request.referer
    end
  end
end
