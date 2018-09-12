class Api::V1::PlaysController < ApplicationController
  def create
    user_id = params[:user_id]
    word = params[:word]
    game_id = params[:game_id]
    game = Game.find(game_id)
    game.plays.create(user_id: user_id, word: word)
    render json: false, status: 201
  end
end
