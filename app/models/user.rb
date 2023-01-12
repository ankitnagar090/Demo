class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  require "mini_magick"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
         
  has_one_attached :profile_photo

  validates :username, uniqueness: true

  validates :email, presence: true, format: { with: /\b[A-Z0-9._%a-z\-]+@+gmail(\.)+[A-Za-z]{2,4}\z/,message: "must be proper form" }
  
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :likes
  has_many :favorites
  has_many :shareds

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users, dependent: :destroy
  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users, dependent: :destroy

  has_many :requested_users, foreign_key: :requested_id, class_name: 'Request'
  has_many :requesters, through: :requested_users, dependent: :destroy
  has_many :requester_users, foreign_key: :requester_id, class_name: 'Request'
  has_many :requesteds, through: :requester_users, dependent: :destroy

end
