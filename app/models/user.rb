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
end
