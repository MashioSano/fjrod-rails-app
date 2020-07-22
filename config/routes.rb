# frozen_string_literal: true

Rails.application.routes.draw do
  root 'books#index'
  resources :books
  devise_for :users
  resources :users, only: [:show]
end
