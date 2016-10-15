Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'prompts#show_current'

  resources :prompts
  get 'past_decrees', to: 'prompts#past_decrees'
  resources :sessions
  resources :votes
  resources :responses
  resources :users, only: [:show]

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

end
