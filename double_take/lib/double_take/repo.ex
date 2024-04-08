defmodule DoubleTake.Repo do
  use Ecto.Repo,
    otp_app: :double_take,
    adapter: Ecto.Adapters.Postgres
end
