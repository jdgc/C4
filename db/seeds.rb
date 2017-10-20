puts "deleting old data"

Rental.delete_all
Game.delete_all
User.delete_all

puts "beginning to seed..."

User.create(email:"admin@admin.com",password:"123123", first_name:"greatest", last_name:"admin")
Game.create([
  {
    name: "Earthbound",
    console: "Super Nintendo",
    description: "This game is really good",
    owner: User.first,
    location: "Shinjuku"
  },
  {
    name: "Halo",
    console: "Xbox",
    description: "blood gulch best map",
    owner: User.first,
    location: "Osaka"
  },
  {
    name: "Final Fantasy X",
    console: "PlayStation",
    description: "Japanese game",
    owner: User.first,
    location: "Meguro"
  },
  {
    name: "Wii Sports",
    console: "Wii",
    description: "its mario",
    owner: User.first,
    location: "Ikebukuro"
  },
  {
    name: "Super Mario Kart",
    console: "Super Nintendo",
    description: "This game is really good",
    owner: User.first,
    location: "Okinawa"
  },
  {
    name: "Zelda: Ocarina of Time",
    console: "Nintendo 64",
    description: "This game is really good",
    owner: User.first,
    location: "Akihabara"
  },
  {
    name: "Mario",
    console: "Gamecube",
    description: "This game is really good",
    owner: User.first,
    location: "Hiroshima"
  },
  {
    name: "Goldeneye 007",
    console: "Nintendo 64",
    description: "This game is really good",
    owner: User.first,
    location: "東京都 目黒区目黒 2-11-3 印刷工場"
  }
  ])

puts "Seed complete."
