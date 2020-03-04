defmodule HoaxExTest do
  use ExUnit.Case
  doctest HoaxEx

  test "greets the world" do
    assert HoaxEx.hello() == :world
  end
end
