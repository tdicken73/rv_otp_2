defmodule Krebs.Cell do
  @moduledoc """

  Contains functions to
   - For a given cell, determine if it will be alive or dead in the next gen
   - Show the cell with a string representation

  """
  @type cell boolean

  def next_gen(_cell, neighbor_count) when neighbor_count === 3 do
    show(true)
  end

  def next_gen(cell, neighbor_count) when neighbor_count === 2 do
    show(cell)
  end

  def next_gen(_cell, _neighbor_count) do
    show(false)
  end

  def show(true) do
    ~s/😐/
  end

  def show(false) do
    ~s/🫥/
  end
end
