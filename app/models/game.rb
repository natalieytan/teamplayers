class Game < ApplicationRecord
  belongs_to :team
  belongs_to :skill
  belongs_to :gender
  geocoded_by :location
  after_validation :geocode
  validates :cost, presence: true
  validates :description, length: { maximum: 1000 }

end
