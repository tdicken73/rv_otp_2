defmodule Jumbotron do
  @moduledoc """
  Documentation for `Jumbotron`.
  """

  alias Jumbotron.Server

  @doc """
  Hello world.

  ## Examples

      iex> Jumbotron.hello()
      :world

  """
  def hello do
    :world
  end

  defdelegate add_score(pid, game, tuple), to: Server

  defdelegate add_score(game, tuple), to: Server

  defdelegate show(pid, game), to: Server

  defdelegate show(game), to: Server

  def as_list(pid \\ :arcade, game) do
    Jumbotron.Server.as_list(pid, game)
  rescue
    _ -> %{}
  end

end
