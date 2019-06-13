use Mix.Config

config :nodulo_api, Nodulo.ApiGql.Endpoint,
  http: [port: 4002],
  server: false

  config :logger, level: :warn
