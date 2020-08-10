# frozen_string_literal: true

Rails.application.routes.draw do
  root 'books#index'
  resources :books
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'}
  resources :users, only: [:show] do
    resource :relationships, only: %i[create destroy]
  end
end
