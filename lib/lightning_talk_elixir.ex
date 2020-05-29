defmodule LightningTalkElixir.Supervisor do
  use Application

  def start(_type, _args) do
    children = [
      {LightningTalkElixir.GenServerCache, []}
    ]

    LightningTalkElixir.ETSCache.start()

    opts = [strategy: :one_for_one, name: LightningTalkElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
