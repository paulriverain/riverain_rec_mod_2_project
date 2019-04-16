# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
GuideComp.destroy_all
Trip.destroy_all

jim = User.create(user_name: 'Jim', password: '1')
sam = User.create(user_name: 'Sam', password: '2')
ben = User.create(user_name: 'Ben', password: '3')
paul = User.create(user_name: 'Paul', password: '123')

op = GuideComp.create(guide_comp_name: 'Outdoor Pursuits')
rei = GuideComp.create(guide_comp_name: 'REI')

one = Trip.create(trip_name: 'MTB', description: 'fun downhill', guide_comp: op)
two = Trip.create(trip_name: 'Snowboarding', description: 'cold and fast', guide_comp: rei)
