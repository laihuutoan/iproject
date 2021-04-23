class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :new_subscriber

  def new_subscriber
    @subscriber = Subscriber.new
  end
end
