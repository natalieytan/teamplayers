class AddAcceptingPlayersToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :accepting_players, :boolean, default: true
  end
end
