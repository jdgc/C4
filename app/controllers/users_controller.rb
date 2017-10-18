class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @games = Game.where(owner_id:@user.id)
    @rentals = Rental.where(user_id:@user.id)
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      # NOT CURRENT USER
      redirect_to edit_user_path(current_user)
    end
  end

  def update
    @user = current_user
    @user.update(user_params)
    @user.save
    redirect_to user(@user)
  end

  private
  def user_params
    params.require(:user).permit(:email, :username)
  end
end
