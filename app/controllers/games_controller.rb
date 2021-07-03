# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :set_game, only: %i[show update destroy]

  # GET /games
  def index
    @games = Game.all

    render json: @games
  end

  # GET /games/1
  def show
    render json: @game
  end

  # POST /games
  def create
    #@game = Game.new(game_params)
    @game = GameManager::GameCreator.call
    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # POST /games/:game_id/draw
  def draw 
    
    @game = GameManager::GameDrawer.call(params[:game_id],3)
    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end 

  # POST /games/:game_id/set
  def set 
    puts params
    @boolean = GameManager::GameSetChecker.call(params[:game_id], params[:card_list])
    
    render json: @boolean
  end 

  # GET /games/:game_id/set
  def set_all
    puts params
    @card_list = GameManager::GameAllSetChecker.call(params[:game_id])
    
    render json: @card_list
  end 

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:game).permit(:game_id, :num_of_players, :start_time, :end_time, :deck, :deck_offset,
                                 :current_cards)
  end

  def set_params
    params.require(:card_list).permit
  end 

end
