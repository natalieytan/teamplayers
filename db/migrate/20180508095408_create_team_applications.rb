class CreateTeamApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :team_applications do |t|
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true
      t.text :message
      t.integer :status

      t.timestamps
    end
  end
end
