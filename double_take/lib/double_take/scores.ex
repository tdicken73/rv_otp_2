###
# 1. Given a game, return a topic string
#    "scores/tetris"
# 2. Subscribe
#    PubSub sub
# 3.

defmodule DoubleTake.Scores do
  alias Phoenix.PubSub

  def high_scores(game) do
    Jumbotron.as_list(game)
    || []
  end

  def topic_name(game) do
    "scores/#{game}"
  end

  def subscribe(game) do
    PubSub.subscribe(DoubleTake.PubSub, topic_name(game))
  end

  def new_score(game, score, player) do
    Jumbotron.add_score(game, {score, player})
    PubSub.broadcast(DoubleTake.PubSub, topic_name(game), {:update, score, player})
  end
end
