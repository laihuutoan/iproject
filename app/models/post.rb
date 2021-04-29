class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  # Post.find_each(&:save)

  visitable :ahoy_visit
  acts_as_votable

  include AASM
  include PostSearch

  has_one_attached :feature_image
  belongs_to :author, class_name: 'User', foreign_key: :created_by_id, required: false
  has_many :comments

  enum tags: [:popular, :suggestion, :guest]

  # AASM
  aasm column: :state, whiny_transitions: false do
    state :draft
    state :published
  end

  def views
    Ahoy::Event.where(name: 'Viewed post', properties: {'controller': 'posts', 'action': 'show', 'id': self.slug}).count
  end
end
