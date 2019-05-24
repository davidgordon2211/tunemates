# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating categories..."
category_1 = Category.create!(name: "What's your favourite track to workout to?")
category_2 = Category.create!(name: "What's the most recent song you listened to?")
category_3 = Category.create!(name: "What song do you listen to in the shower?")
category_4 = Category.create!(name: "Favourite road trip tune?")
puts "Finished."
