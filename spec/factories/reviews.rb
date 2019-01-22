FactoryBot.define do
  factory :review do
    title { "MyString" }
    content { "MyText" }
    user { nil }
    company { nil }
  end
end
