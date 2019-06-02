use Mix.Config

config :nodulo_bellas, Nodulo.Bellas.Repo,
       database: "nodulo_bellas_dev",
       username: "postgres",
       password: "postgres",
       hostname: "localhost",
       port: 5432,
       pool_size: 10
