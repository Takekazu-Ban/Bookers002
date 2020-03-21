Rails.application.routes.draw do
  # URLにusersを含む
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ログイン・サインイン後、user一覧画面に移行
  root 'users#index'

  # (仮)ログイン・サインイン後、book一覧画面に移行
  #root 'books#index'

  resources :books, only: [:create, :index, :show, :edit, :destroy, :update]
  resources :users, only: [:index, :edit, :updete]

end
