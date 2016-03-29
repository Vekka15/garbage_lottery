Rails.application.routes.draw do
  root 'assignations#index'
  put '/restart', to: 'assignations#restart'
  resources :assignations, only: [:index]
  resources :invitations, only: [:index, :new, :create]
  resources :users, only: [:index, :new]
  delete '/user/:id', to: 'users#delete', as: 'user'
  devise_for :users, controllers: {registrations: "users/registrations"}
  post '/add', to: 'users#add'
end
