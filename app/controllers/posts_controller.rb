class PostsController < ApplicationController
  before_action :set_post, only: %i[ show like ]
  before_action :set_type, only: %i[ index ]
  after_action :track_action, only: %i[ show ]

  def index
    @pagy, @posts = pagy Post.search_results(params[:query].present? ? params[:query] : '*')
  end

  def show

  end

  def like
    @liked ? @post.unliked_by(current_user) : @post.liked_by(current_user)
    render json: { liked: current_user.voted_for?(@post), likes: @post.votes_for.size}
  end

  protected

  def track_action
    ahoy.track "Viewed post", request.path_parameters
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
    @liked = current_user.voted_for?(@post) if user_signed_in?
  end

  def set_type
    @is_archives = params[:archives].present? || params[:type] == 'archives'
  end
end
