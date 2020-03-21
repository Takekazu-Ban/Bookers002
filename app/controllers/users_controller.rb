# userプロフィール
class UsersController < ApplicationController
	# 一覧
	def index
		# Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
		@user = User.new
		# 全てのデータを取り出して、格納
		@users = User.all

	end

	# 編集
	def edit
		# ユーザー情報取得後、＠userに保存
		@user = Use.find(params[:id])
	end

	# アップデート
	def update
	end

private

	# 投稿データの受け取り
  	def user_params
  	params.require(:user).permit(:name, :image, :introduction)
   	end

end

