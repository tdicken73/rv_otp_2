defmodule QuotationForm do
    @types %{text: :string}

    defstruct text: ""

    def changeset(params) do
      {%__MODULE__{}, @types}
      |> Ecto.Changeset.cast(params, Map.keys(@types))
      |> Ecto.Changeset.validate_required(:text)
      |> Map.put(:action, :validate)
    end
end
