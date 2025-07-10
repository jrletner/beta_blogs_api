require 'faker'

Blog.destroy_all
Category.destroy_all
User.destroy_all
Profile.destroy_all


# seed categories
categories = []
5.times do
  categories << Category.create!(name: Faker::Book.unique.genre)
end

# seed users
users = []
10.times do
  users << User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.unique.username,
    email: Faker::Internet.unique.email
  )
end

# seed blogs (with category)
20.times do
  blog = Blog.create!(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraph(sentence_count: 5),
    user: users.sample
  )
  blog.categories << categories.sample(rand(1..3))
end
