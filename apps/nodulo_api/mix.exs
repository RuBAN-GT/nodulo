defmodule Nodulo.Api.MixProject do
  use Mix.Project

  def project do
    [
      app: :nodulo_api,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Nodulo.Api.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:nodulo_bellas, in_umbrella: true},
      {:nodulo_elisen, in_umbrella: true},
      {:absinthe, "~> 1.4"},
      {:absinthe_plug, "~> 1.4"},
      {:corsica, "~> 1.0"},
      {:phoenix, "~> 1.4.3"},
      {:phoenix_pubsub, "~> 1.1"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
