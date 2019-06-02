defmodule Nodulo.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false},
      {:distillery, "~> 2.0"},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false}
    ]
  end
end
