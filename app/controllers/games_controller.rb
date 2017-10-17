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
  end

  def update
     @game = Game.new(game_params)
    if @game.save
      redirect_to root_path
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
    params.require(:game).permit(:name, :description, :console, :photo)
  end
end
