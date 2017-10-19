class Game < ApplicationRecord
  geocoded_by :location
  has_many :rentals
  has_many :potatoes
  after_validation :geocode, if: :location_changed?
  CONSOLES = ["Nintendo 64", "PlayStation", "Super Nintendo", "Xbox", "Wii", "Gamecube"]
  belongs_to :owner, class_name: 'User'
  has_attachment :photo
  validates :location, :name, :owner, :description, presence: true
  validates :console, inclusion: { in: CONSOLES }

def rental_status
    rental = self.rentals.first
    if self.owner == current_user && self.available? == true
      return "edit"
    elsif self.available? == false && rental.start_date < Date.today && rental.end_date > Date.today
      return "unavailable"
    elsif self.available? == false && rental.start_date > Date.today && rental.end_date > Date.today
      return "future_rental"
    else
      return "available"
    end
  end

def self.current_rental(game)
  Rental.where(game_id:game.id).each do |rental|
    return rental if rental.start_date < Time.now && rental.end_date > Time.now
  end
end

end

