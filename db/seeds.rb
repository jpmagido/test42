# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def perform
  destroy
  create_users
  create_user_test
end

def destroy
  Article.destroy_all
  User.destroy_all
end

def create_users
  100.times do
    FactoryBot.create(:user)
  end
  p '100 users created ✅'
end

def create_user_test
  User.new(email: 'test@test.com', password: 'blablabla')
  p "User created; password: 'blablabla', email: 'test@test.com' ✅"
end

def create_articles
  100.times do
    FactoryBot.create(:article)
  end
  p '100 articles created ✅'
end

perform