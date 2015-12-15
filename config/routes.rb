Rails.application.routes.draw do
  root :to => 'posts#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users
  resources :posts do
    collection { get :search }
    resources :comments
  end
end
