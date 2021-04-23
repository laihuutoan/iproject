class PostsController < ApplicationController
  before_action :set_post, only: %i[ show ]

  def index
    @pagy, @posts = pagy(Post.all)
    @is_archives = params[:archives].present?
  end

  def show
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
