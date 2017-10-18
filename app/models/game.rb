class Game < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :location_changed?
  CONSOLES = ["Nintendo 64", "PlayStation", "Super Nintendo", "Xbox", "Wii", "Gamecube"]
  belongs_to :owner, class_name: 'User'
  has_attachment :photo
  validates :location, :name, :owner, :description, presence: true
  validates :console, inclusion: { in: CONSOLES }
end

