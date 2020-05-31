cores = :erlang.system_info(:logical_processors)

LightningTalkElixir.ETSCache.write({:key, :value})
LightningTalkElixir.GenServerCache.write({:key, :value})

Benchee.run(
  %{
    "ETSCache" => fn ->
      LightningTalkElixir.ETSCache.read(:key)
    end,
    "GenServerCache" => fn ->
      LightningTalkElixir.GenServerCache.read(:key)
    end
  },
  parallel: cores,
  warmup: 1,
  time: 2,
  print: [fast_warning: false]
)
