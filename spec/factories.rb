require 'ffaker'

FactoryBot.define do

  factory :user do
    email { FFaker::Internet.email }
    password { 'blablabla' }
  end

  factory :article do
    title { FFaker::Book.title }
    content { FFaker::Book.description }
    association :user
  end
end