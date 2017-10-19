module ApplicationHelper


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

   def availability_check
     @rental = Rental.where(game_id: game.id).first
     if @rental.end_date < Date.today
      @game.update(available?: true)
      @game.save
      @rental.destroy
   end

end
end



