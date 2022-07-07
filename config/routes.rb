# frozen_string_literal: true

Rails.application.routes.draw do
  # Admin routes

  namespace :admin do
    resources :users do
      delete :avatar, on: :member, action: :destroy_avatar
    end

    resources :companies

    resources :contacts

    resources :partners do
      delete :logo, on: :member, action: :destroy_logo
    end

    root to: 'contacts#index'
  end

  # Error pages

  match '/404', to: 'errors#not_found', via: :all

  match '/422', to: 'errors#unprocessable', via: :all

  match '/500', to: 'errors#internal_server_error', via: :all

  # Defines the root path route ("/")

  root 'pages#show', page: 'home'

  # Devise routes

  devise_for :users, controllers: {

    registrations: 'users/registrations'

  }

  # Users routes

  resources :users, only: %i[index]

  # Contacts routes

  resources :contacts, only: %i[new create]
end
