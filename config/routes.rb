Rails.application.routes.draw do

  resources :dashboard, only: [:index, :create, :update] do
    collection do
      put :update_password
      resources :subscriptions
      resources :invoices
    end
  end

  resources :quick_books, only: [:index] do
    collection do
      get :authenticate
      get :oauth_callback
    end
  end

  devise_for :users, controllers: {
      passwords: 'users/passwords'
  }

  resources :statics, only: [:create] do
    collection do
      get :hosting
      get :reseller
      get :dns
      get :infrastructure
      get :support
      get :team
      get :contact_us
    end
  end

  root to: 'statics#support'
end
