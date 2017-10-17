class Game < ApplicationRecord

  CONSOLES = ["Nintendo 64", "PlayStation", "Super Nintendo", "Xbox", "Wii", "Gamecube"]
  belongs_to :owner, class_name: 'User'
  has_attachment :photo
  validates :name, :owner, :description, presence: true
  validates :console, inclusion: { in: CONSOLES }


end

