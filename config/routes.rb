# frozen_string_literal: true

Rails.application.routes.draw do
  get 'pages/home', to: 'pages#home', defaults: { format: 'html' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
