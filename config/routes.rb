Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users

  root 'events#index'
  get '/users/:id', to: 'users#show', as: 'users_show'

  # resources :users, only: [:show]
  resources :events do
   resources :attendances, only: [:create, :destroy ]
  end
end
