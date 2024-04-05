defmodule JumbotronTest do
  use ExUnit.Case
  doctest Jumbotron

  test "greets the world" do
    assert Jumbotron.hello() == :world
  end
end
