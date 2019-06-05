puts "Cleaning database..."
Category.destroy_all

puts "Creating categories..."


categories = [
   {name: "What's your favourite track to workout to? 🏋", color: "card-category-red" },
   {name: "What's the most recent song you listened to? 🆒", color: "card-category-blue"},
   {name: "Your favourite road trip tune 🚘", color: "card-category-purple"},
   {name: "A song describing your last relationship 💔", color: "card-category-yellow"},
   {name: "What song do you listen to in the shower? 💦", color: "card-category-red"},
   {name: "What's the most embarrassing song you know by heart? ❤️", color: "card-category-blue"},
   {name: "What song makes you cry? 😭", color: "card-category-purple"},
   {name: "What song describes the host? 😉", color: "card-category-yellow"},
   {name: "Choose a song that should be the new national anthem 👏", color: "card-category-red"},
   {name: "What song do you want to walk down the aisle at your wedding? 😍", color: "card-category-blue"},
   {name: "Choose your favorite 80s disco song 🕺", color: "card-category-purple"},
   {name: "Which Kanye song best represents you? 👍", color: "card-category-yellow"},
   {name: "Which song reminds you of summer? 🌞", color: "card-category-red"},
   {name: "What song reminds you of your job? 👨", color: "card-category-blue"},
   {name: "What song reminds you of school? 🎓", color: "card-category-purpe"},
   {name: "What song would be the soundtrack of your life? 🎵", color: "card-category-yellow"},
   {name: "What's your go-to karaoke song? 🎵", color: "card-category-red"}

]

categories.each do |category|
   Category.create category
end
puts "Finished."
