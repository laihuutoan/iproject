class PostsController < ApplicationController
  before_action :set_post, only: %i[ show ]
  before_action :set_type, only: %i[ index ]

  def index
    @pagy, @posts = pagy(Post.search_results(params[:query].present? ? params[:query] : '*'))
  end

  def show

  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_type
    @is_archives = params[:archives].present? || params[:type] == 'archives'
  end
end
