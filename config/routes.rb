Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'prompts#index'

  resources :prompts
  resources :sessions



  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  #match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

end
