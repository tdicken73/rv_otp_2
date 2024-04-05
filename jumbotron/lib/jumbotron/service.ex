defmodule Jumbotron.Service do
  alias Jumbotron.Arcade

  # client
  def start_link(games) do
    arcade = Arcade.new(games)
    spawn_link(fn -> loop(arcade) end)
  end


  def add(pid, game, score, player) do
    send(pid, {:add, game, score, player})
  end

  def show(pid, game) do
    send(pid, {:show, game, self()})
    receive do
      m -> m
    end
  end



  # server
  defp loop(arcade) do
    arcade
    |> listen()
    |> loop()
  end

  defp listen(arcade) do
    receive do
      {:add, game, score, player} ->
        Arcade.add_score(arcade, game, {score, player})

      {:show, game, from_pid} ->
        send(from_pid, Arcade.show(arcade, game))
        arcade
    end

  end
end
