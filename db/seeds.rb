puts "Cleaning database..."
Category.destroy_all

puts "Creating categories..."


categories = [
   {name: "What's your favourite track to workout to? 🏋" },
   {name: "What's the most recent song you listened to? 🆒"},
   {name: "Your favourite road trip tune 🚘"},
   {name: "A song describing your last relationship 💔"},
   {name: "What song do you listen to in the shower? 💦"},
   {name: "What's the most embarrassing song you know by heart? ❤️"},
   {name: "What song makes you cry? 😭"},
   {name: "What song describes the host? 😉"},
   {name: "Choose a song that you think should be the new national anthem 👏"},
   {name: "What song do you want to walk down the aisle at your wedding? 😍"},
   {name: "Choose your favorite 80s disco song 🕺"},
   {name: "Which Kanye song best represents you? 👍"},
   {name: "Which song reminds you of summer? 🌞"},
   {name: "What song reminds you of your job? 👨"},
   {name: "What song reminds you of school? 🎓"},
   {name: "What song would be the soundtrack of your life? 🎵"}
   {name: "What's your go-to karaoke song? 🎵"}

]

categories.each do |category|
   Category.create category
end
puts "Finished."
