FactoryBot.define do
  factory :item do
    name { "MyString" }
    quantity { 1 }
    grocery_list { nil }
  end
end
