class Subscriber < ApplicationRecord
  validates :email, presence: true, uniqueness: true, valid_emails: true
end
