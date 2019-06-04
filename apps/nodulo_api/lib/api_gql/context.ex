defmodule Nodulo.ApiGql.Context do
  @moduledoc """
  Plug context with cather an information about client

  @see https://hexdocs.pm/absinthe/context-and-authentication.html
  """
  @behaviour Plug

  alias Nodulo.ApiGql.Guardian
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _) do
    context = build_context(conn)
    Absinthe.Plug.put_options(conn, context: context)
  end

  defp build_context(conn) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, current_user, _claims} <- authorize(token) do
      %{current_user: current_user}
    else
      _ -> %{}
    end
  end

  defp authorize(token) do
    Guardian.resource_from_token(token)
  end
end
