class Game < ApplicationRecord

  CONSOLES = ["PlayStation", "Xbox", "Wii", "Gamecube", "Nintendo 64", "Super Nintendo"]
  belongs_to :owner, class_name: 'User'
  has_attachment :photo
  validates :name, :owner, :description, presence: true
  validates :console, inclusion: { in: CONSOLES }


end

