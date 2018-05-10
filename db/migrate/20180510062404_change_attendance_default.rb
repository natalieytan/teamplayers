class ChangeAttendanceDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :game_players, :attendance_status, 1
  end
end
