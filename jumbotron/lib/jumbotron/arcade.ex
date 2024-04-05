defmodule Jumbotron.Arcade do
  alias Jumbotron.Board

  def new(games) do
    for game <- games, into: %{}, do: {game, Board.new()}
  end

  def add_score(arcade, game, {score, player}) do
    arcade
    # |> Map.update(game, [{score, player}], fn board -> Board.add(board, {score, player}) end)
    |> Map.update(game, [{score, player}], &Board.add(&1, {score, player}) )
  end

  def show(arcade, game) do
    arcade
    |> Map.get(game)
    |> Board.show()
  end
end
