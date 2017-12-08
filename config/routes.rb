Rails.application.routes.draw do
  devise_for :users
  resources :restaurants do
    resources :dishes
  end
  root to: 'users#index', via: :get
  get 'auth/facebook', as: "auth_provider"
  get 'auth/facebook/callback', to: 'users#login'
  resources :users
end
