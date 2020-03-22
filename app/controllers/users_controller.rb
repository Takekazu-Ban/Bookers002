# userプロフィール
class UsersController < ApplicationController
	# 一覧
	def index
		# ログイン時のユーザーデータを渡す
		@user = current_user
		# 全てのデータを取り出して、格納
		@users = User.all


		# Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    	@book = Book.new
     	# 全てのデータを取り出す
     	@books = Book.all
	end

	# 詳細
	def show
		# Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    	@book = current_user
     	# 全てのデータを取り出す
     	@books = Book.all

		@user = User.find(params[:id])
	end

	# アップデート
	def update
		user = User.find(params[:id])
		user.update(user_parms)
		redirect_to user_path(@user.id)
		# サクセスメッセージの表示
		flash[:notice] = "You have updated user successfully."
	end

	# 編集
	def edit
		#@User = User.new(user_params)
    	#@Users = User.all
		# ユーザー情報取得後、＠userに保存
		@user = User.find(params[:id])
	end

	# アップデート
	def update
	end

private

	# 投稿データの受け取り
  	def user_params
  	params.require(:user).permit(:name, :profile_image_id, :introduction)
   	end

end

