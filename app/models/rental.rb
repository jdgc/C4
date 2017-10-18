class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :game
  validates :price, :user, :game, :start_date, :end_date, presence: true
  validates :start_date, inclusion: { in: (Date.today..Date.today+5.years), :message => "This date is in the past. I can't let you do that." }
  validates :start_date, inclusion: { in: (Date.today+1.days..Date.today+5.years) }
end
