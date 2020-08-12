# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create user
1.upto 20 do |n|
  user = User.create(name: "testuser-#{n}", email: "testuser-#{n}@example.com", uid: SecureRandom.uuid, password: 'password', password_confirmation: 'password')
  user.image.attach(io: File.open(Rails.root.join('db/seeds/images/user_default.jpeg')), filename: 'user_default.jpeg')
end

# create followings and followers
user = User.first
2.upto 20 do |n|
  user.active_relationships.create(follower_id: n)
  user.passive_relationships.create(following_id: n)
end

1.upto 10 do |n|
  user.books.create(title: "book-title-#{n}", memo: "book-memo-#{n}")
  user.reports.create(title: "report-title-#{n}", body: "report-body-#{n}")
end
