defmodule Nodulo.Bellas.MixProject do
  use Mix.Project

  def project do
    [
      app: :nodulo_bellas,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.8",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  def application do
    [
      extra_applications: [:logger, :faker_elixir_octopus],
      mod: {Nodulo.Bellas.Application, []}
    ]
  end

  defp deps do
    [
      {:argon2_elixir, "~> 2.0"},
      {:comeonin, "~> 5.1"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},

      # Data generation
      {:ex_machina, "~> 2.3"},
      {:faker_elixir_octopus, "~> 1.0.0"},

      # Test env
      {:stream_data, "~> 0.4.3", only: :test},
      {:quixir, "~> 0.9", only: :test}
    ]
  end
end
