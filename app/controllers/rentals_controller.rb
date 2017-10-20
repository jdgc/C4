class RentalsController < ApplicationController
  before_action :authenticate_user!
  def new
    @game = Game.find(params[:game_id])
    @rental = Rental.new
  end

  def create
    @game = Game.find(params[:game_id])
    @rental = Rental.new(rental_params)
    if @rental.start_date < Date.today || @rental.start_date > @rental.end_date
      flash[:alert] = "Invalid date format."
      redirect_to game_path(@game)
      return false
    end
    @rental.price = ((@rental.end_date - @rental.start_date) / 86400)
    @rental.game = @game
    @rental.user = current_user
    if current_user == @rental.game.owner
      flash[:alert] = "You cannot rent your own game ;)"
      redirect_to root_path
      return false
    elsif @rental.save && valid?(@game, @rental)
      @game.update(available?: false)
      @game.save
      redirect_to rental_path(@rental)
      return true
    else
      flash[:alert] = "Somebody has already booked that date."
      redirect_to game_path(@game)
      return false
    end
  end


  def show
    @rental = Rental.find(params[:id])
  end

  private
  def rental_params
    params.require(:rental).permit(:price, :start_date, :end_date)
  end

  def valid?(game, test)
    all_rentals = Rental.where(game_id:game.id)
    all_rentals.each do |item|
      if item.end_date >= test.end_date && item.start_date < test.start_date
        return false
      end
    end
    return true
  end
end
