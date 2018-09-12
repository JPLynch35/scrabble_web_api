class Api::V1::GamesController < ApplicationController
  def show
    game_id = params[:id]
    game = Game.find(game_id)
    render json: game
  end
end
