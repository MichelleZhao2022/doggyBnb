# frozen_string_literal: true

Rails.application.routes.draw do
  get 'pages/index'
  get 'pages/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  namespace :api do
    resources :accommodations
  end
end
