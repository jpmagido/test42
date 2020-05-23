require 'ffaker'

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { 'blablabla' }
  end

  factory :membership do
    association :user
    association :group
  end

  factory :group do
    title { FFaker::Book.title }
    description { FFaker::Book.description }
    association :user
  end

  factory :article do
    title { FFaker::Book.title }
    content { FFaker::Book.description }
    association :user
  end
end