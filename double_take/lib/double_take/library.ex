defmodule DoubleTake.Library do
  @moduledoc """
  The Library context.
  """

  import Ecto.Query, warn: false
  alias DoubleTake.Repo

  alias DoubleTake.Library.Quotation

  @doc """
  Returns the list of quotations.

  ## Examples

      iex> list_quotations()
      [%Quotation{}, ...]

  """
  def list_quotations do
    Repo.all(Quotation)
  end

  def first_quotation do
    from(q in Quotation, limit: 1, order_by: [asc: :id])
    |> Repo.one()
  end

  def next_quotation(quotation) do
    from(q in Quotation, limit: 1, order_by: [asc: :id], where: q.id > ^quotation.id)
    |> Repo.one()
    |> Kernel.||(first_quotation())
  end

  @doc """
  Gets a single quotation.

  Raises `Ecto.NoResultsError` if the Quotation does not exist.

  ## Examples

      iex> get_quotation!(123)
      %Quotation{}

      iex> get_quotation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_quotation!(id), do: Repo.get!(Quotation, id)

  @doc """
  Creates a quotation.

  ## Examples

      iex> create_quotation(%{field: value})
      {:ok, %Quotation{}}

      iex> create_quotation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_quotation(attrs \\ %{}) do
    %Quotation{}
    |> Quotation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a quotation.

  ## Examples

      iex> update_quotation(quotation, %{field: new_value})
      {:ok, %Quotation{}}

      iex> update_quotation(quotation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_quotation(%Quotation{} = quotation, attrs) do
    quotation
    |> Quotation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a quotation.

  ## Examples

      iex> delete_quotation(quotation)
      {:ok, %Quotation{}}

      iex> delete_quotation(quotation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_quotation(%Quotation{} = quotation) do
    Repo.delete(quotation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking quotation changes.

  ## Examples

      iex> change_quotation(quotation)
      %Ecto.Changeset{data: %Quotation{}}

  """
  def change_quotation(%Quotation{} = quotation, attrs \\ %{}) do
    Quotation.changeset(quotation, attrs)
  end
end
