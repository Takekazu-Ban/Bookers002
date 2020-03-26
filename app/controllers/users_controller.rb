# userプロフィール
class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :fraud_prevntion, only: [:edit, :update]

	# 不正アクセス防止
	def fraud_prevntion
		@user = User.find(params[:id])
		unless current_user.id == @user.id
			redirect_to user_path(current_user.id)
		end

	end

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

	# 編集
	def edit
		# ユーザー情報取得後、＠userに保存
		@user = User.find(params[:id])
	end

	# アップデート
	def update
		user = User.find(params[:id])
		if user.update(user_params)
		redirect_to user_path(current_user.id)
		# サクセスメッセージの表示
		flash[:notice] = "You have updated user successfully."
		else
		redirect_to user_path(current_user.id)
		# エラーメッセージ表示
		flash[:alert] = "error!!!!"
		end
	end

private


	# 投稿データの受け取り
  	def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
   	end

end

