json.data do
  json.id @game.id
  json.type 'game'
  json.attributes do
    json.name @game.name
    json.started @game.started
  end
  json.relationships do
    json.players do
      json.data do
        json.array! @game.players do |player|
          json.id player.id
          json.type 'player'
        end
      end
    end
    json.creator do
      json.data do
        json.id @current_user.id
        json.type 'user'
      end
    end
  end
end

json.included do
  json.array! @game.players do |player|
    json.id player.id
    json.type 'player'
    json.attributes do
      json.user_id player.user_id
      json.game_id player.game_id
    end
    json.relationships do
      json.user do
        json.data do
          json.id player.user.id
          json.type 'user'
        end
      end
    end
  end
  json.array! @game.players do |player|
    json.id player.user.id
    json.type 'user'
    json.attributes do
      json.email player.user.email
    end
  end
end
