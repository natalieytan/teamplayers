class TeamApplicationsController < ApplicationController
  before_action :set_team, only: [:index, :create, :new]
  before_action :team_application_params, only: [:create]
  before_action :set_team_application, only: [:edit, :update, :destroy]
  before_action :auth_actions, only: [:edit, :update,:destroy]

  def index
    authorize @team, :show_applications?
  end

  def own
    @team_applications = current_user.applied_teams
  end

  def new
    @team_application = TeamApplication.new
  end

  def own
    @team_applications = current_user.team_applications
  end

  def edit

  end

  def update
    status = params.require(:team_application).permit(:status)
      if @team_application.update(status)
        flash[:notice] = "Successfully reviewed application"
        redirect_to team_team_applications_path(@team_application.applied_team)
      else
        flash.now[:alert] = "Unable to review application. Please check errors"
        render :edit
      end
  end

  def destroy
    @team_application.destroy
    redirect_to myapplications_path , notice: 'Successfully deleted your application.'
  end

  def create
    @team_application = TeamApplication.new(team_application_params)
    @team_application.applied_team = @team
    @team_application.applicant = current_user
    if @team_application.save
      flash[:notice] = "Team application successfully submitted."
      redirect_to @team
    else
      flash.now[:alert] = "Team application not successful. Please review errors."
      render :new
    end
  end


  private
  def set_team
    @team = Team.find(params[:team_id])
  end

  def set_team_application
    @team_application = TeamApplication.find(params[:id])
  end

  def team_application_params
    params.require(:team_application).permit(:message)
  end

  def auth_actions
    authorize @team_application
  end

end
