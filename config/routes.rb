# frozen_string_literal: true

Rails.application.routes.draw do
  root 'books#index'
  devise_for :users
  resources :books
end
