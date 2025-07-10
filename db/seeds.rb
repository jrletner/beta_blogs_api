# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# Clear existing data (optional, for dev/test only)
Profile.destroy_all
Blog.destroy_all
Category.destroy_all
User.destroy_all

# Seed Categories
categories = []
5.times do
  categories << Category.create!(name: Faker::Book.unique.genre)
end

# Seed Users & Profiles
users = []
10.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.unique.username,
    email: Faker::Internet.unique.email
  )
  # Profile is created automatically via after_create
  user.profile.update!(
    bio: Faker::Lorem.sentence(word_count: 10),
    avatar_url: Faker::Avatar.image
  )
  users << user
end

# Seed Blogs (with categories)
20.times do
  blog = Blog.create!(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraph(sentence_count: 5),
    user: users.sample
  )
  blog.categories << categories.sample(rand(1..3))
end
