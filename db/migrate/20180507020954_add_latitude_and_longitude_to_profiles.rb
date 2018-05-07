class AddLatitudeAndLongitudeToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :latitude, :decimal
    add_column :profiles, :longitude, :decimal
  end
end
