class Post < ApplicationRecord

  has_one_attached :post_file
  has_many :comments, dependent: :destroy
  has_many :likes , as: :likeable
  has_many :favorites, dependent: :destroy
  has_many :shareds
  belongs_to :user
  enum :status, { published: 0, unpublished: 1 }
end
