class GamesController < ApplicationController

  def index
    @games = Game.all
    if params[:search]
      @games = Game.where('name ILIKE ?', "%#{params[:search]}%")
    else
      @games = Game.all.order("created_at DESC")
    end
  end

  def console
    @games = Game.where(console:params[:console])
  end

  def show
    @game = Game.find(params[:id])
    @rental = Rental.new
    @status = rental_status(@game)
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.owner = current_user
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
    if @game.owner != current_user
      redirect_to root_path
    end
  end

  def update
     @game = Game.find(params[:id])
    if @game.owner != current_user
      return false
      redirect_to root_path
    end
     @game.update(game_params)
    if @game.save
      redirect_to game_path(@game)
    else
      render :edit
    end
  end

  def delete
    @game = Game.find(params[:id])
    @game.destroy
  end


  private

  def game_params
    params.require(:game).permit(:name, :description, :console, :photo, :location)
  end

def rental_status(game)
    rental = game.rentals.first
    if game.owner == current_user && game.available? == true
      return "edit"
    elsif game.available? == false && rental.start_date < Date.today && rental.end_date > Date.today
      return "unavailable"
    elsif game.available? == false && rental.start_date > Date.today && rental.end_date > Date.today
      return "future_rental"
    else
      return "available"
    end
  end
end
