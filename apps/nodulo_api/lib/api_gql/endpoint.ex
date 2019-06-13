defmodule Nodulo.ApiGql.Endpoint do
  @moduledoc """
  Router for GraphQL service
  """

  use Phoenix.Endpoint, otp_app: :nodulo_api

  # CORS
  plug Corsica,
    origins: "*",
    allow_credentials: true,
    allow_methods: ["GET", "POST", "OPTIONS"],
    allow_headers: :all

  # WS integration
  socket "/socket", Nodulo.ApiGql.UserSocket,
    websocket: true,
    longpoll: false

  # Code reloading
  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  # Generating uniq id for each incoming request
  plug Plug.RequestId

  # Logging component
  plug Plug.Logger

  # Parsing request body
  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  # Router integration
  plug Nodulo.ApiGql.Router
end
