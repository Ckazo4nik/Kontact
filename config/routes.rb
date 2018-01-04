Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
          post 'order' => 'order_items#create'
          get 'order' => 'order_items#index'
          get 'carts/show'
          delete 'logout' =>  'sessions#destroy'
          post 'login' => 'sessions#create'
          get 'profile' => 'users#profile'
          root to: 'homes#index'
          get 'order_my' => 'order_items#show_order'
          get 'orders' => 'orders#index'
          get 'orders/:id' => 'orders#show'
          delete 'orders/:id' => 'orders#destroy'
          get 'users' => 'users#index'
          get 'dishess' => 'dishes#index'

          resources :dishes
          resource :home, only: [:show]
          resources :homes
          resources :sessions, only: [:create, :destroy]
          resources :restaurants do
            resources :dishes do
              post 'order_items' => 'order_items#create'
            end
          end
    end
  end
end
