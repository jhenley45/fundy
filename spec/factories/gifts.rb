# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gift do
    name "MyText"
    description "MyText"
    reason "MyText"
    end_date "2014-03-24 09:14:30"
    goal 1
  end
end
