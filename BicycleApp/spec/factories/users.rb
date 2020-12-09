FactoryBot.define do
  factory :user, class: User do
    name { "name" }
    email { "test@example.com" }
    gender { 0 }
    birthday { Date.new(1987, 06, 05) }
    password { "testuser1" }
    password_confirmation { "testuser1" }
    introduction { "はじめまして！" }
  end

  factory :admin, class: User do
    name { "admin" }
    email { "admintest@example.com" }
    gender { 0 }
    birthday { Date.new(1987, 06, 05) }
    password { "adminuser1" }
    password_confirmation { "adminuser1" }
    introduction { "はじめましてadminです！" }
    admin { true }
  end

  factory :other_user, class: User do
    name { "other" }
    email { "otheruser@example.com" }
    gender { 0 }
    birthday { Date.new(1987, 06, 05) }
    password { "otheruser1" }
    password_confirmation { "otheruser1" }
    introduction { "はじめましてotherです！" }
  end
end
