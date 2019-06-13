defmodule Nodulo.ApiGql.Router do
  @moduledoc """
  GraphQL router component
  """

  use Nodulo.ApiGql, :router

  pipeline :graphql do
    plug Nodulo.ApiGql.Context
  end

  scope "/graphql" do
    pipe_through :graphql

    forward "/", Absinthe.Plug.GraphiQL,
      schema: Nodulo.ApiGql.Schema,
      json_codec: Jason
  end
end
