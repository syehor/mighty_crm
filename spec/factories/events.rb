# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    start_date "2012-08-17"
    end_date "2012-08-17"
    status 1
    client_id 1
    car nil
    created_by 1
  end
end
