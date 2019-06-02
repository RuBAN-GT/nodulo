use Mix.Config

config :nodulo_api,
  namespace: Nodulo.Api

# Configures the endpoint
config :nodulo_api, Nodulo.ApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HiJ0gB42lqyntlbqMZ+ra4XuxXJF+fa11Ed9xi8Yn+mIQgZGXeJXssbmL7OZXK1P",
  pubsub: [name: Nodulo.Api.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
