class TeamPlayerPolicy < ApplicationPolicy
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