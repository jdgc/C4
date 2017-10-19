class RentalsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @rental = Rental.new
  end

  def create
    @game = Game.find(params[:game_id])
    @rental = Rental.new(rental_params)
    @rental.price = ((@rental.end_date - @rental.start_date) / 86400)
    @rental.game = @game
    @rental.user = current_user
    if @rental.save && valid?(@game, @rental)
      @game.update(available?: false)
      @game.save
      redirect_to rental_path(@rental)
    elsif !user_signed_in?
      flash[:alert] = "You must be signed in to do that."
      redirect_to game_path(@game)
    elsif current_user == @game.owner
      flash[:alert] = "You cannot rent your own game ;)"
      redirect_to game_path(@game)
    else
      flash[:alert] = "Please enter a valid rental date"
      redirect_to game_path(@game)
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
