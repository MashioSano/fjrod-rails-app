# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "testuser#{n}@example.com" }
    password { 'password' }
    uid { SecureRandom.uuid }

    factory :tony_stark do
      name { 'Tony Stark' }
      email { 'tonystark@example.com' }
    end
    factory :steve_rogers do
      name { 'Steve Rogers' }
      email { 'steverogers@example.com' }
    end
  end
end
