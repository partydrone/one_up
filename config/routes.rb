Rails.application.routes.draw do
  ##
  # Authentication
  get '/sign_in', to:                   'sessions#new'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/sign_out', to:                'sessions#destroy', via: [:get, :post]

  ##
  # Resources
  resources :events, shallow: true do
    resources :activities, :invitations
    resources :registrations, only: [:index, :edit, :update, :destroy]
  end

  resources :identity_services,
            :users

  ##
  # Root
  root to: 'pages#home'
end
