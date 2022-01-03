# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root 'statics#show', page: 'home'

  # Statics routes

  get '/:page', to: 'statics#show'

  # Devise routes

  devise_for :users

  # User routes
  resources :users
end
