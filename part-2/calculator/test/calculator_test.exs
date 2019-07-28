defmodule CalculatorTest do
  use ExUnit.Case
  doctest Calculator

  setup _pid do
    {:ok, Calculator.start}
  end

  test "returns value added" do
    assert Calculator.add(pid, 10) == 10
  end
end
