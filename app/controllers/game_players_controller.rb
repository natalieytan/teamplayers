class GamePlayersController < ApplicationController
  before_action :set_game, only: [:new, :create]
  before_action :set_game_player, only: [:edit, :update]
  before_action :auth_actions, only: [:edit, :update]

  def new
    authorize @game, :new_player?
    @game_player = GamePlayer.where(game: @game, user: current_user).first
    puts @game_player.inspect
    if @game_player.present?
      redirect_to edit_game_player_path(@game_player.id)
    else
      @game_player = GamePlayer.new()
    end
  end

  def create
    authorize @game, :create_player?
    @game_player.game = @game
    @game_player.user = current_user
    if @game_player.save
      flash[:notice] = "Your attendance for the game has been updated."
      redirect_to @game
    else
      flash[:alert] = "Your attendance for the game could not be updated."
      render :new
    end
  end

  def edit
    @game = @game_player.game
  end

  def update
    if @game_player.update(attendance_status)
      flash[:notice] = "Your attendance for the game has been updated."
      redirect_to @game_player.game
    else
      flash[:alert] = "Your attendance for the game could not be updated."
      render :new
    end
  end


  private
  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_game_player
    @game_player = GamePlayer.find(params[:id])
  end

  def attendance_status
    params.require(:game_player).permit(:attendance_status)
  end

  def auth_actions
    authorize @game_player
  end

end
