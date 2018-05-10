class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.references :team, foreign_key: true
      t.references :skill, foreign_key: true
      t.text :description
      t.text :location
      t.datetime :matchday
      t.decimal :cost
      t.boolean :open_to_public
      t.text :message_to_public

      t.timestamps
    end
  end
end
