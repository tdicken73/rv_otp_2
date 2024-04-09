defmodule DoubleTake.Library.Quotation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quotations" do
    field :name, :string
    field :text, :string
    field :steps, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(quotation, attrs) do
    quotation
    |> cast(attrs, [:name, :steps, :text])
    |> validate_required([:name, :steps, :text])
  end
end
