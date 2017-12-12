Rails.application.routes.draw do
  get 'signout', to: 'api/v1/sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  namespace :api do
    namespace :v1 do
      resources :homes
      resources :sessions, only: [:create, :destroy]
      resources :restaurants do
        resources :dishes
      end
    end
  end
  root to: "api/v1/homes#index"
end
