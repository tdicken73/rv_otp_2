defmodule Spring.Cell do

  def show(state) do
    # match state to true of false
    if state == true do
      IO.puts("X")
    else
      IO.puts("O")
    end
  end

  def evolve(state, n_count) do
    cond do
      n_count == 3 -> true
      n_count == 2 -> state
      true -> false
    end
  end
end
