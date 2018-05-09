class TeamPlayersController < ApplicationController
  before_action :set_team, only: [:index, :update]
  before_action :set_team_player, only: [:edit, :update, :destroy]
  before_action :auth_actions, only: [:edit, :update,:destroy]
  before_action :team_player_params, only: [:update]

  def index
    @team_players = @team.team_players.includes(:user =>:profile)
    authorize @team, :show_team_players?
  end

  def edit
    if @team_player.team.owner == @team_player.user
      render :owner_edit
    else
      render :edit
    end
  end

  def update
    if @team_player.update(team_player_params)
      flash[:notice] = "Successfully updated team player information"
      redirect_to team_team_players_path(@team)
    else
      flash.now[:alert] = "Unable to update team player details. Please check errors"
      if @team_player.team.owner == @team_player.user
        render :owner_edit
      else
        render :edit
      end
    end
  end

  def destroy
    team = @team_player.team
    if @team_player.user == team.owner
      redirect_to team, alert: "You cannot delete the team owner from your team."
    else
      @team_player.destroy
      redirect_to team , notice: "Successfully deleted player from your team."
    end
  end

  private
  def set_team
    @team = Team.find(params[:team_id])
  end

  def set_team_player
    @team_player = TeamPlayer.find(params[:id])
  end

  def team_player_params
    if @team_player.team.owner == @team_player.user
      player_params = params.require(:team_player).permit(:role)
    else
      player_params = params.require(:team_player).permit(:role, :admin)
    end
  end

  def auth_actions
    authorize @team_player
  end

end
