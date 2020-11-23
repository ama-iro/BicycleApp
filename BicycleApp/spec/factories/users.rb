FactoryBot.define do
  factory :user do
    sequence(:name){|n| "name_#{n}"}
    sequence(:email) { |n| "test#{n}@example.com" }
    gender { 0 }
    birthday { Date.new(1987, 06, 05) }
    password { "testuser1" }
    password_confirmation { "testuser1" }
    introduction { "はじめまして！" }
  end
end
