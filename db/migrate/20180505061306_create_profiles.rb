class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.integer :gender
      t.text :image_data
      t.string  :city
      t.string  :state
      t.string  :country

      t.timestamps
    end
  end

end
