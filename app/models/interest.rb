class Interest < ApplicationRecord
  enum skill: { beginner: 1, casual: 2, intermediate: 3, advanced: 4 , professional: 5}

  belongs_to :sport
  belongs_to :user
  validates :sport_id, presence: true
  validates :skill, presence: true
  validates_uniqueness_of :user_id, {:scope => :sport_id, message: "can only list each sport as an interest once."}

  
  def skilltitle
    skill.titleize
  end

  def skillstars
    Interest.skills[self.skill]
  end

end
