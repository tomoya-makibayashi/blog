class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
  has_many :articles
  
  has_one_attached :user_image, dependent: :destroy
  
  validates :nickname, :prefecture, :age, :hobby, :motto, :self, :user_image, presence: true
  
end
