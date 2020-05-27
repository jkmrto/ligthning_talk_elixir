defmodule LightningTalkElixir.Supervisor do
  use Application

  def start(_type, _args) do
    children = [
      {LightningTalkElixir.GenServerCache, []}
    ]

    :ets.new(:ligthning_talk_cache, table_opts())

    opts = [strategy: :one_for_one, name: LightningTalkElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def table_opts() do
    [
      :bag,
      :named_table,
      :public,
      {:read_concurrency, true},
      {:write_concurrency, false}
    ]
  end
end
