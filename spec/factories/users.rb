FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
