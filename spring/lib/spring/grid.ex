defmodule Spring.Grid do
  def new() do
    w = 20
    h = 20
    grid = %{}

    for x <- 1..w do
      for y <- 1..h do
        grid = Map.put(grid, {x, y}, Enum.random([true, false]))
      end
    end
  end

  def evolve(grid) do
    grid
  end
end
