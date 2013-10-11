# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :document do
    title "MyString"
    attachment { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'report.pdf'), 'application/pdf') }
    author "MyString"
    source_url "MyString"
    collection
  end
end
