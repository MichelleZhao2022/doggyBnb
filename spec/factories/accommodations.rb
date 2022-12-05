FactoryBot.define do
  factory :accommodation do
    name { "MyString" }
    description { "MyText" }
    city { "MyString" }
    country { "MyString" }
    reviews_count { 1 }
    average_rating { "9.99" }
  end
end
