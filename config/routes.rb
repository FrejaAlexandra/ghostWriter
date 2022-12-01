Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :books do
    resources :shares, only: [:index, :create, :update]
  end
  resources :shares, only: :delete
  get '/tagged', to: "books#tagged", as: :tagged
end
