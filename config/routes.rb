Rails.application.routes.draw do
  # devise_for :home
  # URLにusersを含む
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ローカル画面へのルート
  root 'homes#index'

  get 'home/about' => 'homes#show'


  resources :books, only: [:create, :index, :show, :edit, :destroy, :update]
  resources :users, only: [:index, :show, :edit, :update]

end
