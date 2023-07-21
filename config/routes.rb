Rails.application.routes.draw do
  get 'users/show'
  devise_for :users

  root 'events#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :events, only: [:new, :create, :index]
  resources :users, only: [:show]
end
