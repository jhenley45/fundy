# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_venmo do
    user nil
    access_token "MyText"
    expires_in 1
    username "MyText"
    first_name "MyText"
    last_name "MyText"
    display_name "MyText"
    email "MyText"
    phone "MyText"
    about "MyText"
    profile_pic "MyText"
    venmo_id 1
    refresh_token "MyText"
  end
end
