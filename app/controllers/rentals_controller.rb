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
    if @rental.save
      redirect_to rental_path(@rental)
    else
      render game_path(@game)
    end
  end

  def show
    @rental = Rental.find(params[:id])
  end

  private
  def rental_params
    params.require(:rental).permit(:price, :start_date, :end_date)
  end
end
