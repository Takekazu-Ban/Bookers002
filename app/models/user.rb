class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	# userモデルにbookモデルを1:Nの関連付け
	has_many :books, dependent: :destroy
	attachment :profile_image

	# sign_in sig_up 名前入力設定 (空白禁止、２〜２０字以内)
	validates :name, length: 2..20
	validates :introduction, length: { maximum:50 }

end
