Rails.application.routes.draw do
  ##
  # Authentication
  get '/sign_in', to:                   'sessions#new'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/sign_out', to:                'sessions#destroy', via: [:get, :post]

  ##
  # Resources
  concern :joinable do
    member do
      post :join
      delete :leave
    end
  end

  resources :events, concerns: :joinable, shallow: true do
    resources :activities, concerns: :joinable
    resources :invitations
    resources :registrations, only: [:index, :edit, :update, :destroy]
  end

  resources :identity_services,
            :users

  ##
  # Root
  root to: 'pages#home'
end
