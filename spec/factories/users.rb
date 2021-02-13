# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "testuser#{n}@example.com" }
    password { 'password' }
    uid { SecureRandom.uuid }
    name { 'testuser' }
  end
end
