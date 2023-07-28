Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users

  root 'events#index'
  get '/users/:id', to: 'users#show', as: 'users_show'

  # resources :users, only: [:show]
  resources :events do
   resources :attendances, only: [:create, :destroy ]
   member do
    get :invite
    post :send_invites
   end
  end

  # get 'events/:id/edit', to: 'events#edit', as: 'edit_event'
  # patch 'events/:id', to: 'events#update'
  # delete 'events/:id', to: 'events#destroy'
end
