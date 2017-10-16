class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :console
      t.string :description
      t.references :owner, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
