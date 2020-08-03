# frozen_string_literal: true

Rails.application.routes.draw do
  root 'books#index'
  resources :books
  # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
   devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:show]
end
