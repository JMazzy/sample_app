# The Micropost model
class Micropost < ActiveRecord::Base
  # Microposts are associated with a user
  belongs_to :user

  # Order microposts by creation date descending
  default_scope -> { order(created_at: :desc )}

  # Validations
  validates :user_id, presence: true
  validates :content, presence: true, length:{ maximum:140 }
end
