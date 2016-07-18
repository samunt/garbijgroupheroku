# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users1 = User.create({first_name: 'Enakshi', last_name: 'Shah', email: 'enakshi.shah@mail.utoronto.ca', password: 'test', phone: '647-222-2222'})

users2 = User.create({first_name: 'Sam', last_name: 'Unterman', email: 'sam@mail.com', password: 'test2', phone: '333-333-3333'})

spaces1 = Space.create({capacity: 4, garbaje_day: 12/01/1995, address: '24 Staynor Crescent', user_id: 1})

spaces2 = ({capacity: 2, garbaje_day: 01/14/14, address: '35 St. George St.', user_id: 2})

transactions = Transaction.create({buy_space_id: 1, sell_space_id: 2, total_fee: 20, transaction_date: 12/31/2015})
