# frozen_string_literal: true

FactoryBot.define do
  factory :report do
    title { '初日報' }
    body { '初めての日報です これから頑張ります' }
    association :user
  end
end
