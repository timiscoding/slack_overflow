Rails.application.routes.draw do
  resources :posts do
    collection { get :search }
    resources :comments
  end
end
