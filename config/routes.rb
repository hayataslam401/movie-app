Rails.application.routes.draw do
  get 'favourites/update'
  devise_for :users
  root 'movies#index'
  get 'search', to:"movies#search"
  get 'reviews', to:"movies#review"
  resources :movies do
    member do
      patch :move
    end
  resources :reviews, except: [:show, :index]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
