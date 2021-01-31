# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { '伝え方が9割' }
    memo { 'なぜ、伝え方で結果が変わるのか?' }
    association :user, factory: :tony_stark
  end
end
