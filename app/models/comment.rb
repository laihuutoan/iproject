class Comment < ApplicationRecord
  belongs_to  :post
  belongs_to  :parent, class_name: 'Comment', optional: true
  has_many    :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy
  belongs_to  :author, class_name: 'User', foreign_key: :created_by_id, required: true

  validates :body, presence: true
end
