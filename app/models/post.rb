class Post < ApplicationRecord
  include AASM

  # AASM
  aasm column: :state, whiny_transitions: false do
    state :draft
    state :published
  end
end
