Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :charges
      post 'order' => 'order_items#create'
      get 'order' => 'order_items#index'
      get 'carts/show'
      delete 'logout' =>  'sessions#destroy'
      post 'login' => 'sessions#create'
      get 'profile' => 'users#profile'
      root to: 'homes#index'
      get 'orders_my' => 'order_items#show_order'
      get 'orders' => 'orders#index'
      get 'orders/:id' => 'orders#show'
      delete 'orders/:id' => 'orders#destroy'
      get 'users' => 'users#index'
      put 'update_profile' => 'users#update'
      get 'dishess' => 'dishes#index'
      get 'my_orders' => 'orders#my_orders'
      resources :orders

      resources :dishes
      resource :home, only: [:show]
      resources :homes
      resources :sessions, only: [:create, :destroy]
      resources :restaurants do

        post 'order_items' => 'order_items#create'
        resources :dishes do
        end
      end
    end
  end
end
