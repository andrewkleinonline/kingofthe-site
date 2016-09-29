Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'prompts#index'

  resources :prompts



  match 'auth/:provider/callback', to: 'prompts#index', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  #match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

end
