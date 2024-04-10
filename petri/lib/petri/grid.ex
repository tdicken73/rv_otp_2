defmodule Petri.Grid do
  @moduledoc """
  A grid of cells in a Petri game.
  """

  def new(width \\ 20, height \\ 20) do
    for x <- 1..width, y <- 1..height, into: %{} do
      {{x, y}, Enum.random([true, false])}
    end
  end

  def evolve(grid) do
    "function"
  end

  def get_neighbors(grid) do
    x = 1
    y = 1

    for x <- (xx - 1)..(xx + 1),
        y <- (yy - 1)..(yy + 1),
        {x, y} != {xx, yy},
        do: Map.get(grid, {x, y}, false)
  end

  def show(grid) do
    grid
    |> Enum.chunk_every(20)
    |> Enum.map(&show_row/1)
    |> Enum.join("\n")
    |> IO.puts()
  end

  def show_row(row) do
    row
    |> Enum.map(fn {_, value} -> Petri.Cell.show(value) end)
    |> Enum.join(" ")
  end
end
