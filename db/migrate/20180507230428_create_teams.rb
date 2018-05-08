class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.references :owner, index: true, foreign_key: { to_table: :users }
      t.references :sport, foreign_key: true
      t.references :skill, foreign_key: true
      t.references :gender, foreign_key: true
      t.references :day, foreign_key: true
      t.text :description
      t.string :street_number
      t.string :route
      t.string :locality
      t.string :administrative_area
      t.string :postal_code
      t.string :country
      t.decimal :latitude
      t.decimal :longitude
      t.text :image_data
      t.timestamps
    end
  end
end
