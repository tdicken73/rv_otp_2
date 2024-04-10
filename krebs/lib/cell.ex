defmodule Krebs.Cell do
  @moduledoc """

  Contains functions to
   - For a given cell, determine if it will be alive or dead in the next gen
   - Show the cell with a string representation

  """


  @doc """
  Given a cell and the number of living neigbhors, determine its next state
  """
  @spec next_gen([boolean()], boolean()) :: boolean()
  def next_gen(living_neighbors, _cell) when living_neighbors === 3, do: true

  def next_gen(living_neighbors, cell) when living_neighbors === 2, do: cell

  def next_gen(_living_neighbors, _cell), do: false

  def show(true) do
    ~s/😐/
  end

  def show(false) do
    ~s/🫥/
  end
end
