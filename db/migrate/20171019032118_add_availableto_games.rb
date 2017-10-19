class AddAvailabletoGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :available?, :boolean, default: true
  end
end
