Rails.application.routes.draw do
  #get 'sessions/new' コントローラー作成時に自動的に書かれる
  #get 'users/new' コントローラー作成時に自動的に書かれる
  

  #views/static_pages/home.html.erbをトップページとして設定
  root to: 'static_pages#home'
  
  #新規登録機能の設定
  get 'signup' , to: 'users#new'
  #ログイン機能の設定
  get 'login' , to: 'sessions#new'
  post 'login' , to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  
  
  #usersモデルのデータを元にするとうこと？
  resources :users
  
  #どーいうこと？
  resources :sessions, only: [:new, :create, :destroy]
end


