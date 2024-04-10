defmodule SpringTest do
  use ExUnit.Case
  doctest Spring

  test "greets the world" do
    assert Spring.hello() == :world
  end
end
