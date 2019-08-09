defmodule CalculatorTest do
  use ExUnit.Case
  doctest Calculator

  setup _context do
    {:ok, [server_id: Calculator.start]}
  end

  test "returns value added", context do
    assert Calculator.add(context[:server_id], 10) == 10
  end

  test "returns value subtracted", context do
    assert Calculator.sub(context[:server_id], 5) == -5
  end

  test "returns value multiplied", context do
    Calculator.add(context[:server_id], 10)
    assert Calculator.mult(context[:server_id], 10) == 100
  end

  test "returns value divided", context do
    Calculator.add(context[:server_id], 10)
    assert Calculator.div(context[:server_id], 10) == 1
  end
end
