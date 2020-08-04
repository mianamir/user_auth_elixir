defmodule AuthElixir.Repo do
  use Ecto.Repo,
    otp_app: :auth_elixir,
    adapter: Ecto.Adapters.Postgres
end
