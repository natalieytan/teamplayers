class GamesController < ApplicationController
  before_action :set_team, only: [:index, :new, :create]
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :auth_actions, only: [:show, :edit, :update,:destroy]
  
  # GET /games
  def index
    @games = @team.games
    authorize @team, :view_games?
  end

  # GET /games/1
  def show
  end

  # GET /games/new
  def new
    @game = Game.new({
      skill: @team.skill,
      gender: @team.gender,
      location: @team.full_street_address
    })
    authorize @team, :new_games?
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  def create
    authorize @team, :create_games?
    @game = Game.new(game_params)
    @game.team = @team
    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      redirect_to @game, notice: 'Game was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
    redirect_to games_url, notice: 'Game was successfully destroyed.' 
  end

  private
    def set_team
      @team = Team.find(params[:team_id])
    end

    
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:skill_id, :description, :location, :gender_id, :matchday, :cost, :open_to_public, :message_to_public)
    end

    def auth_actions
      authorize @game
    end
end
