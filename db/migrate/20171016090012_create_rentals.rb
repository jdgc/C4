class CreateRentals < ActiveRecord::Migration[5.0]
  def change
    create_table :rentals do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true
      t.integer :price
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
