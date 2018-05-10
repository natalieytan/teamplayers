class CreateGamePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :game_players do |t|
      t.references :game, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :attendance_status

      t.timestamps
    end
  end
end
