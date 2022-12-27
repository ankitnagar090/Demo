Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   root to: "posts#index"
  # Defines the root path route ("/")
  # root "articles#index"
  # get '/search_user', to: 'search/search_user'
  resources :posts do
    get "search", on: :collection
    get 'profile', on: :collection
    resources :comments
  end
  
end
