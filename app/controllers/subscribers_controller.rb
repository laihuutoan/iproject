class SubscribersController < ApplicationController
  before_action :set_subscriber, only: %i[ show ]

  def index

  end

  def new

  end

  def create
    @subscriber = Subscriber.find_or_initialize_by(subscriber_params)

    respond_to do |format|
      if @subscriber.save
        format.html { redirect_to subscribers_path }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def subscriber_params
    params.fetch(:subscriber, {}).permit(:email, :from)
  end

  def set_subscriber
    @subscriber = Subscriber.find(params[:id])
  end
end
