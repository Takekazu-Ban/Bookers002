class BooksController < ApplicationController
# 投稿・一覧設定
  def index
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @book = Book.new
    # 全てのデータを取り出して、格納
    @books = Book.all

    # ログイン時のユーザーデータを渡す
    @user = current_user
    # 全てのデータを取り出して、格納
    @users = User.all
  end

  # 投稿設定
  def create

  	# ストロングパラメータを使用
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
      ### 投稿時の条件分岐 ###
      # DBに保存
  	  if @book.save
      # サクセスメッセージ表示
      flash[:notice] = "Book was successfully created."
  	  # 詳細ページへリダイレクト
  	  redirect_to  book_path(@book.id)
      else
      # エラーメッセージ表示
      flash[:alert] = "error !!!"
      redirect_to books_path(@book.id)
      end

    end

  # 詳細ページ設定
  def show
    # 取得したURLを@bookに格納
    @book = Book.find(params[:id])
    # ログイン時のユーザーデータを渡す
    @user = current_user
  end

  # 編集ページ設定
  def edit
    # 取得したURLを@bookに格納
    @book = Book.find(params[:id])
  end

  # 編集を保存
  def update
    book = Book.find(params[:id]) #viewsを通らないので@を付けない
    # DBに上書き
    if book.update(book_params)
    # 詳細ページへリダイレクト
    redirect_to  book_path(book.id)
    # サクセスメッセージ表示
    flash[:notice] = "Book was successfully updated."
      else
        redirect_to  book_path(book.id)
      # エラーメッセージ表示
      flash[:alert] = "error !!!"
    end
  end

  # 削除設定
  def destroy
    # データ（レコード）を１件取得
    @book = Book.find(params[:id])
    # データ（レコード）を削除
    @book.destroy
    # 投稿・一覧画面へリダイレクト
    redirect_to books_path
  end

  # 戻る設定
  def back
    # 投稿・一覧設定へリダイレクト
    redirect_to books_path
  end

  private

  # 投稿データの受け取り
  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
