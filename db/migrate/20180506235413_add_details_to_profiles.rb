class AddDetailsToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :postcode, :string
    add_column :profiles, :description, :string
  end
end