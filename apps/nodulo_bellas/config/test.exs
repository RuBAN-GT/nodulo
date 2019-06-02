use Mix.Config

config :nodulo_bellas, Nodulo.Bellas.Repo,
       database: "nodulo_bellas_test",
       username: "postgres",
       password: "postgres",
       hostname: "localhost",
       port: 5432,
       pool: Ecto.Adapters.SQL.Sandbox
