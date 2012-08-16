# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    number "MyString"
    color "MyString"
    fuel "MyString"
    year "2012-08-16"
    engine_size 1.5
  end
end
