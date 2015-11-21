# The Micropost model
class Micropost < ActiveRecord::Base
  # Microposts are associated with a user
  belongs_to :user

  # Order microposts by creation date descending
  default_scope -> { order(created_at: :desc )}

  # Image uploader
  mount_uploader :picture, PictureUploader

  # Validations
  validates :user_id, presence: true
  validates :content, presence: true, length:{ maximum:140 }
  validate :picture_size

  private ################################

  #validates the size of an uploaded picture
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

  #end private############################
end
