class Comment < ActiveRecord::Base

  belongs_to :user
  validates :body, presence: true
  scope :for_photo, -> (photo_id) { where(photo_id: photo_id) }

end