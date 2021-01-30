# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "testuser#{n}@example.com" }
    password { 'password' }

    factory :tony_stark do
      name { 'Tony Stark' }
      uid { '521fcdaa-0b7e-493a-a3f2-4b12be8f4e57' }
    end
    factory :steave_rogers do
      name { 'Steave Rogers' }
      uid { '13r3r-gsnr-4dda-1lv0-dvssve21' }
    end
  end
end
