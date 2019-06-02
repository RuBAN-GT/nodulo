defmodule Nodulo.ApiWeb.Context do
  @moduledoc """
  Plug context with cather an information about client

  @see https://hexdocs.pm/absinthe/context-and-authentication.html
  """
  @behaviour Plug

  def init(opts), do: opts

  def call(conn, _) do
    Absinthe.Plug.put_options(conn, context: %{})
  end
end
