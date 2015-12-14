Rails.application.routes.draw do
  resources :users
  resources :posts do
    collection { get :search }
    resources :comments
  end
end
