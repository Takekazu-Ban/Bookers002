class Book < ApplicationRecord
	# user_idに関連付け、userモデル参照
	belongs_to :user

	# バリデーションチェック
	validates :title, presence: true
	# 本の感想を1〜200字までに指定
	validates :body, length: 1..200

end
