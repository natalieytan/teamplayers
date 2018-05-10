class Skill < ApplicationRecord
  has_many :teams
  has_many :games
end
