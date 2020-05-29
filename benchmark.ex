LightningTalkElixir.ETSCache.write({:key, :value})
LightningTalkElixir.GenServerCache.write({:key, :value})

Benchee.run(
  %{
    "flat_map" => fn ->
      LightningTalkElixir.ETSCache.read(:key)
    end,
    "flat_map2" => fn ->
      LightningTalkElixir.GenServerCache.read(:key)
    end
  },
  parallel: 16,
  print: [fast_warning: false]
)
