FactoryBot.define do
  factory :post do
    area { 1 }
    place { "MyString" }
    required_time { 1 }
    description { "MyText" }
    user { nil }
  end
end
