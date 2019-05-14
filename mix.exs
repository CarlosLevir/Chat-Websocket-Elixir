defmodule ChatWebsocketElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :ChatWebsocketElixir,
      version: "1.0.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {ChatWebsocketElixir, []},
      extra_applications: [:logger]
    ]
  end
end
