use Mix.Config

config :nodulo_bellas, ecto_repos: [Nodulo.Bellas.Repo]

import_config "#{Mix.env()}.exs"
