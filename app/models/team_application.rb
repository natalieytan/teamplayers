class TeamApplication < ApplicationRecord
  enum status: { pending: 1, rejected: 2, accepted: 3 }

  belongs_to :applicant, class_name: 'User', foreign_key: "user_id"
  belongs_to :applied_team, class_name: 'Team', foreign_key: "team_id"
  validates_uniqueness_of :applicant, {:scope => :applied_team, message: "can only apply for each team once."}
  
  after_update :add_approved_to_team

  def add_approved_to_team
    TeamPlayer.create({
      team_id: team_id,
      user_id: user_id,
      admin: false
    })
  end

end
