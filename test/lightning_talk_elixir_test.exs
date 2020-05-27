defmodule LightningTalkElixirTest do
  use ExUnit.Case
  doctest LightningTalkElixir

  test "greets the world" do
    assert LightningTalkElixir.hello() == :world
  end
end
