class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable
  has_one :profile
  has_many :interests
  has_many :sports, through: :interests
  has_many :teams_owned, :class_name => "Team", :foreign_key => :owner_id
  has_many :team_players
  has_many :teams, through: :team_players
  has_many :team_applications
  has_many :applied_teams, through: :team_applications
  has_many :game_players
  has_many :games, through: :game_players
  after_create :create_profile

  def upcoming_games
    GamePlayer.joins(game: :team).where("user_id = ? AND matchday > ?", id, DateTime.now)
  end

  def admin_of_team?(team)
    TeamPlayer.where(user_id: id, team: team, admin: true).exists?
  end

  def administrated_teams
    Team.joins(:team_players).where(team_players: {admin:true, user_id: id})
  end

  def is_in_team?(team)
    TeamPlayer.where(user_id: id, team: team).exists?
  end

  def is_not_in_team?(team)
    !TeamPlayer.where(user_id: id, team: team).exists?
  end

  def create_profile
    new_profile = Profile.new({
      user_id: id,
      first_name: "No",
      last_name: "Name",
      gender: 4
    })
    new_profile.save(validate: false)
  end
end
