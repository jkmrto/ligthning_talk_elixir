defmodule LightningTalkElixir.GenServerCache do
  use GenServer

  def start_link(_arg) do
    GenServer.start_link(__MODULE__, [], [])
  end

  def init(_) do
    state = %{}
    {:ok, state}
  end

  def handle_cast({:write, {key, value}}, state) do
    state = Map.put(state, key, value)
    {:noreply, state}
  end
end
