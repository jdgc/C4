class Game < ApplicationRecord

  CONSOLES = ["Wii U", "PlayStation 4", "Xbox One", "Xbox 360", "PlayStation 3", "Wii", "Dreamcast", "PlayStation 2"]
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"

  validates :name, presence: true
  validates :description, presence: true
  validates :console, inclusion: { in: CONSOLES }


end

