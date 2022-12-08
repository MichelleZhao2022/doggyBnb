# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  # resources :pages, only: [:show, :index]
  resources :accommodations, only: %i[index show], defaults: { format: 'json' }
end
