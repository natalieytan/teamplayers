class AddDefaultValueToPlayerAdmin < ActiveRecord::Migration[5.1]
  def change
    change_column :team_players, :admin, :boolean, default: false
  end
end
