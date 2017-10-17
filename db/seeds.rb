# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

  # t.string   "name"
  #  t.string   "console"
   # t.string   "description"
  #  t.integer  "owner_id"

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Game.create([
  {
    name: "Earthbound",
    console: "Super Nintendo",
    description: "This game is really good",
    owner_id: 1
  },
  {
    name: "Halo",
    console: "Xbox",
    description: "blood gulch best map",
    owner_id: 1
  },
  {
    name: "Final Fantasy X",
    console: "PlayStation",
    description: "Japanese game",
    owner_id: 1
  },
  {
    name: "Wii Sports",
    console: "Wii",
    description: "its mario",
    owner_id: 1
  },
  {
    name: "Super Mario Kart",
    console: "Super Nintendo",
    description: "This game is really good",
    owner_id: 1
  },
  {
    name: "Zelda: Ocarina of Time",
    console: "Nintendo 64",
    description: "This game is really good",
    owner_id: 1
  },
  {
    name: "Mario",
    console: "Gamecube",
    description: "This game is really good",
    owner_id: 1
  },
  {
    name: "Earthbound",
    console: "Super Nintendo",
    description: "This game is really good",
    owner_id: 1
  }
  ])

