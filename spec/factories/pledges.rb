# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pledge do
    user nil
    gift nil
    amount "9.99"
    owner false
  end
end
