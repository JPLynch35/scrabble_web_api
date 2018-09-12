class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    plays = []
    object.plays.each do |play|
      plays << {user_id: play.user_id, score: play.score}
    end
    plays
  end
end
