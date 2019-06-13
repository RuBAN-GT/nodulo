defmodule Nodulo.Api.Application do
  @moduledoc """
  The main entrypoint of an API component
  """

  use Application

  def start(_type, _args) do
    children = [Nodulo.ApiGql.Endpoint]
    opts = [strategy: :one_for_one, name: Nodulo.Api.Supervisor]

    Supervisor.start_link(children, opts)
  end

  # Update the endpoint configuration whenever the application is updated.
  def config_change(changed, _new, removed) do
    Nodulo.ApiGql.Endpoint.config_change(changed, removed)
    :ok
  end
end
