defmodule DoubleTake.Repo.Migrations.CreateQuotations do
  use Ecto.Migration

  def change do
    create table(:quotations) do
      add :name, :string
      add :steps, :integer
      add :text, :text

      timestamps(type: :utc_datetime)
    end
  end
end
