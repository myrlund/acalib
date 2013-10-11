# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :documents_tag, :class => 'DocumentsTags' do
    document nil
    tag nil
  end
end
