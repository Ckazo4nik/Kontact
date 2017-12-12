Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'order_items/create'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'order_items/update'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'order_items/destroy'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'carts/show'
    end
  end

  post 'logout', to: 'api/v1/sessions#destroy', as: 'logout'
  post 'login', to: 'api/v1/sessions#create', as: 'login'

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
