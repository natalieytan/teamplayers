class CreateInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :interests do |t|
      t.references :user, foreign_key: true
      t.references :sport, foreign_key: true
      t.integer :skill
    end
  end
end
