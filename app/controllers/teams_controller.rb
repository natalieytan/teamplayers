class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :auth_actions, only: [:update, :edit, :destroy]
  # GET /teams
  def index
    @teams = current_user.teams
    @games = current_user.upcoming_games
  end

  # GET /teams/1
  def show
    @team_players = TeamPlayer.joins(user: :profile).where(team: @team)
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  def create
    @team = Team.new(team_params)
    @team.owner = current_user
    if @team.valid?
      begin
        customer = Stripe::Customer.create(
          :email => params[:stripeEmail],
          :card  => params[:stripeToken])
  
        charge = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => 200,
          :description => 'Set up team on Teamplayers',
          :currency    => 'AUD')
  
      rescue Stripe::CardError => e
        charge_error = e.message
      end
      if charge_error
        flash.now[:alert] = charge_error
        render :new
      else
        @team.save
        TeamMailer.confirmation(@team.owner, @team).deliver_now
        flash[:notice] = "Successfully created your team."
        redirect_to @team
      end
    else
      flash.now[:error] = 'Unable to create team. Please review errors.'
      render :new
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :image, :sport_id, :skill_id, :gender_id, :day_id, :description, :street_number, :route, :locality, :administrative_area, :postal_code, :country, :latitude, :longitude)
    end

    def auth_actions
      authorize @team
    end
end
