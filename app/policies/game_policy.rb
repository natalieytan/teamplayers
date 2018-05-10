class GamePolicy < ApplicationPolicy
  
  def show
    record.open_public? || user.is_in_team?(record.team)
  end

  def edit?
    user.admin_of_team?(record.team)
  end

  def update?
    user.admin_of_team?(record.team)
  end

  def destroy?
    user.admin_of_team?(record.team)
  end

end