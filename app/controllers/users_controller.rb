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
     	# ログイン時のユーザーデータを渡す
		@user = User.find(params[:id])
		# 1:Nの関係で対応する本をuserに関連付ける
		@b = @user.books

		# Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    	@book = Book.new
    	@book_user = User.find(params[:id])
     	# 全てのデータを取り出す
     	@books = Book.all
	end

	# アップデート
	def update

		user = User.find(params[:id])
		user.update(user_parms)
		redirect_to user_path(current_user.id)
		# サクセスメッセージの表示
		flash[:notice] = "You have updated user successfully."
	end

	# 編集
	def edit
		#@user = User.new(user_params)
    	#@Users = User.all

		# ユーザー情報取得後、＠userに保存
		@user = User.find(params[:id])
	end

	# アップデート
	def update
		user = User.find(params[:id])
		user.update(user_params)
		redirect_to user_path(user.id)
	end

private

	# 投稿データの受け取り
  	def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
   	end

end

