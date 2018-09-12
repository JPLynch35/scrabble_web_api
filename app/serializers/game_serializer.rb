class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    player_1_score = 0
    player_2_score = 0
    player_scores = Hash.new(0)
    object.plays.each do |play|
      player_scores[play.user_id] = player_scores[play.user_id] + play.score
    end
    player_scores.map do |user_id, total_score|
      {'user_id': user_id, 'score': total_score}
    end
  end
end
