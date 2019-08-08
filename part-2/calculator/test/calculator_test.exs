defmodule CalculatorTest do
  use ExUnit.Case
  doctest Calculator

  setup _context do
    {:ok, [server_id: Calculator.start]}
  end

  test "returns value added", context do
    assert Calculator.add(context[:server_id], 10) == 10
  end
end
