class Post < ApplicationRecord

  has_many :comments, dependent: :destroy, as: :commentable
  belongs_to :user

  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :image_upload, styles: {
    croppable: '600x600>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image_upload, :content_type => /\Aimage\/.*\Z/
end
