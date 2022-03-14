# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :companies
    resources :contacts

    root to: 'contacts#index'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Error pages

  match '/404', to: 'errors#not_found', via: :all

  match '/500', to: 'errors#internal_server_error', via: :all

  # Defines the root path route ("/")

  root 'pages#show', page: 'home'

  # Devise routes

  devise_for :users

  # Users routes

  resources :users

  # Contacts routes

  resources :contacts

  # Companies routes

  resources :companies
end
