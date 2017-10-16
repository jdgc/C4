class Game < ApplicationRecord
  belongs_to :user
    CONSOLES = ["Wii U", "PlayStation 4", "Xbox One", "Xbox 360", "PlayStation 3", "Wii", "Dreamcast", "PlayStation 2"]
  validates :title, presence: true
  validates :description, presence: true
  validates :console, inclusion: { in: CONSOLES }


  def self.search(search)
  where("title ILIKE ? OR description ILIKE ? OR console ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end

end

