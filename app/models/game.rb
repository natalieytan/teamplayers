class Game < ApplicationRecord
  belongs_to :team
  belongs_to :skill
  belongs_to :gender
  has_many :game_players, dependent: :destroy
  has_many :users, through: :game_players

  geocoded_by :location
  after_validation :geocode
  validates :cost, presence: true
  validates :description, length: { maximum: 1000 }
  validates :matchday, presence: true
  validate :matchday_cannot_be_in_the_past
  after_create :populate_gameplayers

  def real_cost
    "$#{"%.2f" % cost}"
  end

  def stripe_cost
    cost*100
  end

  def attending_players
    GamePlayer.includes(user: :profile).where(game: id, attendance_status: 2)
  end

  def not_attending_players
    GamePlayer.includes(user: :profile).where(game: id, attendance_status: 3)
  end

  def awaiting_players
    GamePlayer.includes(user: :profile).where(game: id, attendance_status: 1)
  end
  
  def matchday_cannot_be_in_the_past
    if matchday.present? && matchday < DateTime.now
      errors.add(:matchday, "can't be in the past")
    end
  end


  def populate_gameplayers
    users << team.users
  end

end
