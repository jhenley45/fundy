# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

jack = User.create!(email: "jack@jack.com", password: 'password')

new_gift = Gift.create!(name: 'a new bike')

jack.pledges.create!(gift: new_gift, amount: 50, owner: true)
