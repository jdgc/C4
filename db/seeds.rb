# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

  # t.string   "name"
  #  t.string   "console"
   # t.string   "description"
  #  t.integer  "owner_id"

  # movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  # Character.create(name: 'Luke', movie: movies.first)
User.create(email:"admin@admin.com",password:"123123")
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
    name: "Earthbound",
    console: "Super Nintendo",
    description: "This game is really good",
    owner: User.first,
    location: "Hokkaido"
  }
  ])
