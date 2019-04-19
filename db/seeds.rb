# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
GuideComp.destroy_all
Trip.destroy_all

# jim = User.create(user_name: 'Jim', password: '1')
# sam = User.create(user_name: 'Sam', password: '2')
# ben = User.create(user_name: 'Ben', password: '3')
# paul = User.create(user_name: 'Paul', password: '123')

op = GuideComp.create(guide_comp_name: 'Outdoor Pursuits')
rei = GuideComp.create(guide_comp_name: 'REI')

one = Trip.create(trip_name: 'Mountain Biking', description: 'Fun downhill mountain biking.', guide_comp: op)
two = Trip.create(trip_name: 'Snowboarding', description: 'For those who like the cold and speed!', guide_comp: rei)
three = Trip.create(trip_name: 'Camping', description: '3 day camp trip in the wilderness.', guide_comp: rei)
four = Trip.create(trip_name: 'Rafting', description: 'Get wild out on the river!', guide_comp: op)
five = Trip.create(trip_name: 'Rock Climbing', description: 'Intermediate rock climbing excursion.', guide_comp: op)
six = Trip.create(trip_name: 'Hiking', description: 'Day hike at Breakneck Ridge', guide_comp: op)
seven = Trip.create(trip_name: 'Stand Up Paddle Boarding', description: 'Morning paddle boarding on the Long Island sound.', guide_comp: rei)
eight = Trip.create(trip_name: 'Sunrise Hike', description: 'Early morning hike at Harriman State Park', guide_comp: rei)
