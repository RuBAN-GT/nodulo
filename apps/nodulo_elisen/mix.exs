defmodule Nodulo.Elisen.MixProject do
  use Mix.Project

  def project do
    [
      app: :nodulo_elisen,
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
      mod: {Nodulo.Elisen.Application, []}
    ]
  end

  defp deps do
    [
      {:ex_machina, "~> 2.3"},
      {:faker_elixir_octopus, "~> 1.0.0"},
      {:memento, "~> 0.3.1"},
      {:memento_migrator, git: "https://github.com/RuBAN-GT/memento_migrator.git"}
    ]
  end
end
