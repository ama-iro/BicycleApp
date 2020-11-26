FactoryBot.define do
  factory :post do
    area { 1 }
    place { "MyString" }
    required_time { 40 }
    description { "MyText" }
    association :user
  end
end
