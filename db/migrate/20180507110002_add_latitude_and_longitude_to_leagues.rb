class AddLatitudeAndLongitudeToLeagues < ActiveRecord::Migration[5.1]
  def change
    add_column :leagues, :latitude, :decimal
    add_column :leagues, :longitude, :decimal
  end
end
