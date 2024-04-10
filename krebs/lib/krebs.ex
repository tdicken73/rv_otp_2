defmodule Krebs do
  @moduledoc """
  Documentation for `Krebs`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Krebs.hello()
      :world

      grid is a struct with the height and width
        - defstruct with height, width, and cells
        - cells is a mapping where the key is a location and the value is a boolean
        - 20 by 20

      constructor populates keys and values for 20x20 grid with random t/f

      if a neighbor is off-grid, provide a default value of false

      cells is a map

      -exports
        new


  """

  @type grid :: %{
    {0, 0} => :boolean,
    {1, 0} => :boolean,
    {2, 0} => :boolean,
    {0, 1} => :boolean,
    {1, 1} => :boolean,
    {2, 1} => :boolean,
    {0, 2} => :boolean,
    {1, 2} => :boolean,
    {2, 2} => :boolean,
  }

  @spec hello(grid()) :: atom()
  def hello(arg) do
    :world
  end
end
