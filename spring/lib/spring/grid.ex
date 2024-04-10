defmodule Spring.Grid do
  def new() do
    w = 6
    h = 6
    for r <- 1..w, c <- 1..h, into: %{}, do: {{r, c}, Enum.random([true, false])}
  end

  def evolve(grid) do

    Enum.reduce(grid, %{}, fn {{rr, cc}, state}, acc ->
      n_count =  for r <- (rr - 1)..(rr + 1), c <- (cc - 1)..(cc + 1), {r, c} != {rr, cc}, do: Map.get(grid, {r, c}, false)
      new_state = Spring.Cell.evolve(state, n_count)
      Map.put(acc, {rr, cc}, new_state)
    end)
  end

end
