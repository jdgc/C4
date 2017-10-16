class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :game
  validates :price, :user, :game, presence: true

end
