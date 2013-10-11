# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :annotation do
    content "MyText"
    x 0
    y 0
    document
  end
end
