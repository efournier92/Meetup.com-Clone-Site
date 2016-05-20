require 'factory_girl'

FactoryGirl.define do
  factory :user do
    provider "github"
    sequence(:uid) { |n| n }
    sequence(:username) { |n| "ringo#{n}" }
    sequence(:email) { |n| "ringo#{n}@beatles.com" }
    avatar_url "https://avatars2.githubusercontent.com/u/?v=3&s=400"
  end
end

