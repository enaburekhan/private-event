Rails.application.routes.draw do
  get 'users/show'
  devise_for :users

  root 'events#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]
  resources :events, only: [:new, :create, :index, :show] do
   resources :attendances, only: [:create, :destroy], module: :events
  end
end
