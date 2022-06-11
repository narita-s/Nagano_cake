Rails.application.routes.draw do

  # 会員側のルーティング設定
  root to: "public/homes#top"

  scope module: :public do
    get "/about", to: "homes#about"
    get "/customers/unsubscribe", to: "customers#unsubscribe"
    patch "/customers/withdrawal", to: "customers#withdrawal"
    resource :customers, only:[:show, :edit, :update]
    resource :address, only:[:index, :edit, :create, :update, :destroy]
  end


  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :new, :show, :edit, :create, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdrawal]

end
