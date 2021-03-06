class TeamPolicy < ApplicationPolicy

  def edit?
    user.admin_of_team?(record)
  end

  def update?
    user.admin_of_team?(record)
  end

  def destroy?
    user == record.owner
  end

  def show_applications?
    user.admin_of_team?(record)
  end

  def show_team_players?
    user.admin_of_team?(record)
  end

  def view_games?
    user.is_in_team?(record)
  end

  def new_games?
    user.admin_of_team?(record)
  end

  def create_games?
    user.admin_of_team?(record)
  end

end