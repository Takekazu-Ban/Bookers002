class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   # userモデルにbookモデルを1:Nの関連付け
   has_many :books, dependent: :destroy
   attachment :profile_image

end
