Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :books do
    resources :shares, only: [:index, :create, :update]
  end
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end
  resources :shares, only: [:index, :delete]
  get '/tagged', to: "books#tagged", as: :tagged
  get 'user_balance', to: 'pages#user_balance'
  post 'user_balance', to: 'pages#add_user_balance'

  get 'wallets', to: 'pages#wallets'
  # mount StripeEvent::Engine, at: '/stripe-webhooks'
end
