class GamePlayer < ApplicationRecord
  enum attendance_status: { awaiting_response: 1, attending: 2, not_attending: 3}
  belongs_to :game
  belongs_to :user
  #validates_uniqueness_of :user_id, {:scope => :game_id, message: "can only attend each game once."}
end
