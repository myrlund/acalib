# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag do
    title "MyString"
    description "MyText"
    position 1
  end
end
