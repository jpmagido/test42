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
  create_articles
  create_groups
  create_memberships
end

def destroy
  Membership.destroy_all
  Group.destroy_all
  Article.destroy_all
  User.destroy_all
end

def create_users
  50.times do
    FactoryBot.create(:user)
  end
  p '50 users created ✅'
end

def create_user_test
  User.create!(email: 'jpmagido@me.com', password: 'blablabla')
  User.create!(email: 'test@test.com', password: 'blablabla')
  p "User created; password: 'blablabla', email: 'test@test.com' ✅"
end

def create_articles
  50.times do
    FactoryBot.create(:article)
  end
  p '50 articles created ✅'
end

def create_groups
  10.times do
    FactoryBot.create(:group)
  end
  p '10 groups created ✅'
end

def create_memberships
  15.times do
    FactoryBot.create(:membership)
  end
  p '15 memberships created ✅'
end

perform