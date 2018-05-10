class GamePlayerPolicy < ApplicationPolicy
  

  def edit?
    user == record.user
  end

  def update?
    user == record.user
  end


end