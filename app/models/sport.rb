class Sport < ApplicationRecord
  has_many :interests
  has_many :users, through: :interests
  has_many :games

  def title_name
    name.titleize
  end

end
