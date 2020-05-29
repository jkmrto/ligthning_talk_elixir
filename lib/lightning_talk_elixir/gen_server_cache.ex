defmodule LightningTalkElixir.GenServerCache do
  use GenServer

  def start_link(_arg) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    state = %{}
    {:ok, state}
  end

  def read(key) do
    GenServer.call(__MODULE__, {:read, key})
  end

  def write({key, value}) do
    GenServer.call(__MODULE__, {:write, {key, value}})
  end

  def handle_call({:write, {key, value}}, _from, state) do
    state = Map.put(state, key, value)
    {:reply, value, state}
  end

  def handle_call({:read, key}, _from, state) do
    value = Map.get(state, key, nil)
    {:reply, value, state}
  end
end
