use Mix.Config

config :nodulo_api,
  namespace: Nodulo.Api

# Configures the endpoint
config :nodulo_api, Nodulo.ApiGql.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HiJ0gB42lqyntlbqMZ+ra4XuxXJF+fa11Ed9xi8Yn+mIQgZGXeJXssbmL7OZXK1P",
  pubsub: [name: Nodulo.Api.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Guardian configuration
config :nodulo_api, Nodulo.ApiGql.Guardian,
  issuer: "nodulo_api",
  secret_key: "+aWAhNP2d7RnPJmzV04tV/7KMQMxIe8PomdM4kzwBkE1J3RJU7lfbpJK6uFlCxN3"

# Env confuration
import_config "#{Mix.env()}.exs"
