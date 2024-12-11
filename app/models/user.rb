class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, 
  :confirmable, :validatable, :invitable
  
  has_many :joboffers, dependent: :destroy
  
  has_many :applications, dependent: :destroy

  has_one_attached :profile_picture
  
end
