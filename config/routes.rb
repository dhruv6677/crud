Rails.application.routes.draw do
  # get 'profiles/index'
  # get 'profiles/show'
  # get 'profiles/new'
  # get 'profiles/edit'
  # get 'home/index'
  resources :profiles
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'home/index'
  # Defines the root path route ("/")
   root "home#index"
end
