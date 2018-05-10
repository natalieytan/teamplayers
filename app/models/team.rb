class Team < ApplicationRecord
  include ImageUploader::Attachment.new(:image)
  after_create :owner_in_team

  belongs_to :owner, class_name: 'User'
  belongs_to :sport
  belongs_to :skill
  belongs_to :gender
  belongs_to :day
  has_many :team_players
  has_many :users, through: :team_players
  has_many :team_applications
  has_many :applicants, through: :team_applications
  has_many :games
  geocoded_by :full_street_address 
  after_validation :geocode
  validates :name, presence: true
  validates :description, length: { maximum: 1000 }

  def full_street_address
    "#{street_number} #{route}, #{administrative_area} #{postal_code}, #{country}"
  end

  def owner_in_team
    team_players.create({
      team_id: id,
      user_id: owner_id,
      admin: true
    })
  end

  def team_admins
    TeamPlayer.where(team_id: id, admin: true)
  end

  def pending_applications
    TeamApplication.where(team_id: id, status: 1)
  end

end