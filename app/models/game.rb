class Game < ApplicationRecord
  belongs_to :user
    CONSOLES = ["Wii U", "PlayStation 4", "Xbox One", "Xbox 360", "PlayStation 3", "Wii", "Dreamcast", "PlayStation 2"]
  validates :title, presence: true
  validates :description, presence: true
  validates :console
end
