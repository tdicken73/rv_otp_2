defmodule Jumbotron.Board do
  def new() do
    []
  end

  def add(board, {score, player}) do
    [{score, player} | board]
    |> Enum.sort(:desc)
    |> Enum.take(5)
  end

  def show(board) do
    board
    |> Enum.map(fn {score, player} -> "#{player}: #{score}" end)
    |> Enum.join("\n")
  end
end
