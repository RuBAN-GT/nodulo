defmodule Nodulo.Elisen.Application do
  @moduledoc false

  use Application
  import Supervisor.Spec, only: [worker: 2]

  def start(_type, _args) do
    children = [
      worker(Nodulo.Elisen.DbWorker, [])
    ]

    opts = [strategy: :one_for_one, name: Nodulo.Elisen.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
