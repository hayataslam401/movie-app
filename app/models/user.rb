class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :movies 
  has_many :favourites
  has_many :reviews, dependent: :destroy  
  enum :role, [ :Member, :Moderator, :Admin ]    
end
