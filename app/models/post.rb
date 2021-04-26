class Post < ApplicationRecord
  include AASM
  include PostSearch

  has_one_attached :feature_image

  belongs_to :author, class_name: 'User', foreign_key: :created_by_id, required: false

  enum tags: [:popular, :suggestion, :guest]

  # AASM
  aasm column: :state, whiny_transitions: false do
    state :draft
    state :published
  end
end
