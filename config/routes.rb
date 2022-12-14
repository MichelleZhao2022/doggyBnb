# frozen_string_literal: true

Rails.application.routes.draw do
  get 'api/search/:city', to: 'api/search#index', as: "api_search", defaults: {format: :json}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#index'

  namespace :api do
    resources :accommodations
    # resources :search, only: :index
  end

  resources :accommodations do
    resources :reservations, only: [:new, :index], controller: "accommodations/reservations"
  end

  get '/*path', to: 'application#index', format: false
end
