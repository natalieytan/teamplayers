class CreateLeagues < ActiveRecord::Migration[5.1]
  def change
    create_table :leagues do |t|
      t.references :sport, foreign_key: true
      t.references :organisation, foreign_key: true
      t.string :name
      t.references :gender, foreign_key: true
      t.references :skill, foreign_key: true
      t.references :day, foreign_key: true
      t.string :street_number
      t.string :route
      t.string :locality
      t.string :administrative_area
      t.string :postal_code
      t.string :country
      t.timestamps
    end
  end
end
