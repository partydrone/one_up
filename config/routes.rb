Rails.application.routes.draw do
  ##
  # Authentication
  get '/sign_in', to: 'sessions#new'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/sign_out', to: 'sessions#destroy', via: [:get, :post]

  resources :identities, :users

  root to: 'pages#home'
end
