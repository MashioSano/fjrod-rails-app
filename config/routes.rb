# frozen_string_literal: true

Rails.application.routes.draw do
  root 'books#index'
  concern :commentable do
    resources :comments
  end
  resources :books, concerns: :commentable
  resources :reports, concerns: :commentable
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  resources :users, only: [:show] do
    resource :relationships, only: %i[create destroy]
    scope module: :users do
      resources :followings, only: [:index]
      resources :followers, only: [:index]
    end
  end
end
