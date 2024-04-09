defmodule DoubleTake.LibraryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DoubleTake.Library` context.
  """

  @doc """
  Generate a quotation.
  """
  def quotation_fixture(attrs \\ %{}) do
    {:ok, quotation} =
      attrs
      |> Enum.into(%{
        name: "some name",
        steps: 42,
        text: "some text"
      })
      |> DoubleTake.Library.create_quotation()

    quotation
  end
end
