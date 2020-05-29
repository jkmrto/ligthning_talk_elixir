defmodule LightningTalkElixir.ETSCache do
  @cache :ligthning_talk_cache

  def start() do
    :ets.new(@cache, table_opts())
  end

  def write({key, value}) do
    :ets.insert(@cache, {key, value})
  end

  def read(key) do
    :ets.lookup(@cache, key)
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
