class Post < ApplicationRecord

  has_one_attached :post_file
  mount_uploader :video, VideoUploader  

  has_many :comments
  has_many :likes
  has_many :favorites
  belongs_to :user
end
