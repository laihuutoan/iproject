class Post < ApplicationRecord
  include AASM
  include PostSearch

  enum tags: [:popular, :suggestion, :guest]

  # AASM
  aasm column: :state, whiny_transitions: false do
    state :draft
    state :published
  end
end
