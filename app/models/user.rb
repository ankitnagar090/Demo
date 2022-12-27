class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable

  validates :email, presence: true, format: { with: /\b[A-Z0-9._%a-z\-]+@+gmail(\.)+[A-Za-z]{2,4}\z/,message: "must be proper form" }
  
  

  has_many :posts
  has_many :comments
  has_many :likes
  has_many :favorites

  

end
