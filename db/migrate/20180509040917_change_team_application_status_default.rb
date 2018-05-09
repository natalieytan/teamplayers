class ChangeTeamApplicationStatusDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :team_applications, :status, 1
  end
end
