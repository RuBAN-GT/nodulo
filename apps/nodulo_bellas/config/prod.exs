use Mix.Config

config :nodulo_bellas, Nodulo.Bellas.Repo,
       database: System.get_env("DB__DATABASE"),
       username: System.get_env("DB__USERNAME"),
       password: System.get_env("DB__PASSWORD"),
       hostname: System.get_env("DB__HOSTNAME"),
       port: System.get_env("DB__PORT"),
       pool_size: 10
