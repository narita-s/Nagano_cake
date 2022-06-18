Rails.application.routes.draw do

  # 会員側のルーティング設定
  root to: "public/homes#top"

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords, :registrations],controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :customer do
    get 'customers/sign_up', to: 'public/registrations#new', as: :new_customer_registration
    resource :customers, only: [:create], as: 'customer_registration', controller: 'public/registrations'
  end

  scope module: :public do
    get "/about", to: "homes#about"
    get "/customers/unsubscribe", to: "customers#unsubscribe"
    patch "/customers/withdrawal", to: "customers#withdrawal"
    resource :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy] do
      collection do
        get "addresses" => "addresses#index"
      end
    end
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete "destroy_all"
      end
    end
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post "confirm" => "orders#confirm"
        get "thanks" => "orders#thanks"
      end
    end
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

end
