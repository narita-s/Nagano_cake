Rails.application.routes.draw do

  # 会員側のルーティング設定
  root to: "public/homes#top"

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customer,skip: [:passwords], controllers: {
    registrations: "customer/registrations",
    sessions: 'customer/sessions'
  }

  scope module: :public do
    get "/about", to: "homes#about"
    get "/customers/unsubscribe", to: "customers#unsubscribe"
    patch "/customers/withdrawal", to: "customers#withdrawal"
    resource :customers, only:[:show, :edit, :update]
  end

  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end



  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
    namespace :admin do
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :new, :show, :edit, :create, :update]

  end


end
