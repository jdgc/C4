class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :game
  validates :price, :user, :game, :start_date, :end_date, presence: true
end
