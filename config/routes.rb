# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Error pages
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  # Defines the root path route ("/")
  root 'pages#show', page: 'home'

  # Statics routes
  get '/:page', to: 'pages#show'

  # Devise routes
  devise_for :users

  # User routes
  resources :users
end
