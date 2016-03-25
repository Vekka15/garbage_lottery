Rails.application.routes.draw do
  root 'assignations#index'
  put '/restart', to: 'assignations#restart'
  resources :assignations
  resources :invitations
  devise_for :users
  # devise_scope :user do
  #   get 'users/invite', to: 'users/registrations#invite', as: 'invite'
  # end
end
