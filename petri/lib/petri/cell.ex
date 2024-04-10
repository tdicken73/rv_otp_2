defmodule Petri.Cell do
  @moduledoc """
  A cell in a Petri game.
  """

  def next_gen(cell, neighbor_count) do
    cond do
      neighbor_count < 2 -> false
      neighbor_count > 3 -> false
      neighbor_count == 3 -> true
      true -> cell
    end
  end

  def show(true) do
    "👾"
  end

  def show(false) do
    "💀"
  end
end
