defmodule Petri.Cell do
  @moduledoc """
  A cell in a Petri game.
  """

  # @type t :: %__MODULE__{
  #         id: String.t(),
  #         inputs: %{String.t() => integer()},
  #         outputs: %{String.t() => integer()}
  #       }

  # @spec new(String.t(), %{String.t() => integer()}, %{String.t() => integer()}) :: t
  # def new(id, inputs, outputs) do
  #   %__MODULE__{id: id, inputs: inputs, outputs: outputs}
  # end

  # @spec id(t) :: String.t()
  # def id(cell), do: cell.id

  # @spec inputs(t) :: %{String.t() => integer()}
  # def inputs(cell), do: cell.inputs

  # @spec outputs(t) :: %{String.t() => integer()}
  # def outputs(cell), do: cell.outputs

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
