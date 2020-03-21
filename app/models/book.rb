class Book < ApplicationRecord
	# user_idに関連付け、userモデル参照
	belongs_to :user
end
