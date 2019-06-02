defmodule Nodulo.ApiWeb.Router do
  use Nodulo.ApiWeb, :router

  pipeline :graphql do
    plug Nodulo.ApiWeb.Context
  end

  scope "/graphql" do
    pipe_through :graphql

    forward "/", Absinthe.Plug.GraphiQL,
      schema: Nodulo.ApiWeb.Schema,
      json_codec: Jason
  end
end
