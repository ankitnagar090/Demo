Rails.application.routes.draw do
    devise_for :users 
    devise_scope :user do  
       get '/users/sign_out' => 'devise/sessions#destroy'     
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   root to: "posts#index"
  # Defines the root path route ("/")
  # root "articles#index"
  # get '/search_user', to: 'search/search_user'
  resources :profiles
  resources :users do
    post 'follow', to: 'follows#follow', on: :collection
    post 'unfollow', to: 'follows#unfollow', on: :collection
    get 'followers', to: 'follows#follower', on: :collection
    get 'following', to: 'follows#following', on: :collection
    post 'accept', to: 'follows#accept', on: :collection
    post 'cancel', to: 'follows#cancel', on: :collection
    get 'requested', to: 'follows#requested', on: :collection
    post 'remove', to: 'follows#remove', on: :collection
  end  
  resources :shareds
  resources :posts do
    resources :likes
    resources :comments do
      resources :likes
    end
  end
end
