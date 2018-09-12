require "rails_helper"

describe "GET /api/v1/games/1" do
  it "returns a game" do
    user1 = User.create(name: 'Bob')
    user2 = User.create(name: 'Jill')
    game = Game.create(player_1_id: user1.id, player_2_id: user2.id)
    player1play = game.plays.create(user_id: user1.id, word: 'Shark', score: 15)
    player2player = game.plays.create(user_id: user2.id, word: 'Shark', score: 16)

    response_json = {
      "game_id":1,
      "scores": [
        {
          "user_id":1,
          "score":15
        },
        {
          "user_id":2,
          "score":16
        }
      ]
    }

    get '/api/v1/games/1'
    expect(response).to be_successful
    received_json = JSON.parse(response.body, symbolize_names: true)
    expect(receieved_json).to eq(response_json)
  end
end