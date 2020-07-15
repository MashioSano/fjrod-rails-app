# frozen_string_literal: true
require Rails.root.join('lib', 'subdomain.rb')
Rails.application.routes.draw do
  resources :books
end
