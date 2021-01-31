# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "testuser#{n}@example.com" }
    password { 'password' }
    uid { SecureRandom.uuid }

    factory :tony_stark do
      name { 'Tony Stark' }
    end
    factory :steave_rogers do
      name { 'Steave Rogers' }
    end
  end
end
