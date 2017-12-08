Rails.application.routes.draw do
  resources :restaurants do
    resources :dishes
  end
end
