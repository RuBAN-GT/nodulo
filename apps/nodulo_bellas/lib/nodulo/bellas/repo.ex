defmodule Nodulo.Bellas.Repo do
  @moduledoc """
  Repository binder over PG adapter
  """

  use Ecto.Repo,
    otp_app: :nodulo_bellas,
    adapter: Ecto.Adapters.Postgres
end
