defmodule LightningTalkElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :lightning_talk_elixir,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {LightningTalkElixir.Supervisor, []}
    ]
  end

  defp deps do
    []
  end
end
