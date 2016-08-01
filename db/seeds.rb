# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
# # Examples:
# #
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)
#
# User.destroy_all
# Space.destroy_all
# Transaction.destroy_all
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# User.destroy_all
# Space.destroy_all
# Transaction.destroy_all
#
# MUST ADD IN CREDIT CARD INFO INTO USERS CREATED BELOW OR ELSE VALIDATIONS FAIL

# users1 = User.create({first_name: 'Enakshi', last_name: 'Shah', email: 'enakshi.shah@mail.utoronto.ca', password: 'test', phone: '647-222-2222', })

# users1 = User.create({first_name: 'Enakshi', last_name: 'Shah', email: 'enakshi.shah@mail.utoronto.ca', password: 'test', phone: '647-222-2222'})

#
# users2 = User.create({first_name: 'Sam', last_name: 'Unterman', email: 'sam@mail.com', password: 'test2', phone: '333-333-3333'})
#
# spaces1 = Space.create({capacity: 4, garbaje_day: 12/01/1995, address: '24 Staynor Crescent', user_id: users1.id})
#
# spaces2 = Space.create({capacity: 2, garbaje_day: 01/14/14, address: '35 St. George St.', user_id: users2.id})
#
# transactions = Transaction.create({buy_space_id: spaces1.id, sell_space_id: spaces2.id, total_fee: 20})
#
# transactions2 = Transaction.create({buy_space_id: spaces2.id, sell_space_id: spaces1.id, total_fee: 14})
