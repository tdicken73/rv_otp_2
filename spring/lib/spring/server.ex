defmodule Spring.Server do
  use GenServer
  alias Spring.Grid

  def start_link(grid) do
    GenServer.start_link(Spring.Server, grid, name: :spring)
  end

  def show(pid \\ :spring) do
    GenServer.call(pid, :show)
    |> Enum.reduce(%{}, fn {location, state}, acc -> Map.put(acc, location, Spring.Cell.get_status(state)) end)
    |> IO.puts()
  end

  def evolve(pid \\ :spring) do
    GenServer.cast(pid, :evolve)
  end

# Server

@impl true
def init(_) do
  {:ok, Grid.new}
end

@impl true
def handle_call(:show, _from, grid) do
  {:reply, grid, grid}
end

@impl true
def handle_cast(:evolve, grid) do
  new_grid = Grid.evolve(grid)
  {:noreply, new_grid}
end
end
