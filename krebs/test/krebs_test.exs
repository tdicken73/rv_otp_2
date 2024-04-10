defmodule KrebsTest do
  use ExUnit.Case
  doctest Krebs

  test "greets the world" do
    assert Krebs.hello() == :world
  end
end
