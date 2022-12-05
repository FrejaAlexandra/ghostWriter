Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :books do
    resources :shares, only: [:index, :create, :update]
  end
  resources :shares, only: [:index, :delete]
  get '/tagged', to: "books#tagged", as: :tagged
  get 'user_balance', to: 'pages#user_balance'
  post 'user_balance', to: 'pages#add_user_balance'
end
