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
    @time_remaining = get_availability(@game)
    @rental = Rental.new
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.owner = current_user
    if @game.save
      flash[:notice] = "Game successfully listed!"
      redirect_to game_path(@game)
    else
      flash[:alert] = "Invalid information."
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
    if @game.owner != current_user
      flash[:alert] = "Invalid user."
      redirect_to root_path
    elsif @game.available? != true
      flash[:alert] = "Cannot edit a game that is being rented out."
      redirect_to game_path(@game)
    end
  end

  def update
     @game = Game.find(params[:id])
    if @game.owner != current_user
      return false
      redirect_to root_path
    elsif @game.available != true
      flash[:alert] = "Cannot edit a game that is being rented out."
      redirect_to game_path(@game)
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
    if @game.owner != current_user
      flash[:alert] = "Invalid user."
      redirect_to root_path
    elsif @game.available? != true
      flash[:alert] = "Cannot delete a game that is being rented out."
      redirect_to game_path(@game)
    end
  end


  private

  def game_params
    params.require(:game).permit(:name, :description, :console, :photo, :location)
  end

  def get_availability(game)
    rental = Rental.where(game_id: game.id)
    return Time.now - rental.end_date
  end
end
