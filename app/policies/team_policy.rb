class TeamPolicy < ApplicationPolicy

  def edit?
    user == record.owner
  end

  def update?
    user == record.owner
  end

  def destroy?
    user == record.owner
  end

end