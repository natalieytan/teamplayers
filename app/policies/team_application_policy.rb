class TeamApplicationPolicy < ApplicationPolicy



  def edit?
    record.pending? && user.admin_of_team?(record.applied_team)
  end

  def update?
    record.pending? && user.admin_of_team?(record.applied_team)
  end

  def destroy?
    user == record.applicant
  end

end