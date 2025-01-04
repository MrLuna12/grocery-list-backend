FactoryBot.define do
  factory :grocery_item do
    name { "MyString" }
    quantity { 1 }
    grocery_list { nil }
  end
end
