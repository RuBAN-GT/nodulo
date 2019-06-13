defmodule Nodulo.Bellas.Application do
  @moduledoc """
  Bellas entrypoint
  """

  use Application

  def start(_type, _args) do
    children = [
      {Nodulo.Bellas.Repo, []}
    ]

    opts = [strategy: :one_for_one, name: Nodulo.Bellas.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
