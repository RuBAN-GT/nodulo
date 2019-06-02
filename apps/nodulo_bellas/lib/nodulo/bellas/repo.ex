defmodule Nodulo.Bellas.Repo do
  use Ecto.Repo,
    otp_app: :nodulo_bellas,
    adapter: Ecto.Adapters.Postgres
end
