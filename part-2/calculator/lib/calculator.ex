defmodule Calculator do
  @moduledoc """
  Documentation for Calculator.
  """

  @doc """
  ## Examples

  #   iex> server_id = Calculator.start
  #   #PID<0.138.0>

  #   iex> Calculator.add(server_id, 10)
  #   10

  #   iex> Calculator.sub(server_id, 5)
  #   5

  #   iex> Calculator.mult(server_id, 10)
  #   50

  #   iex> Calculator.div(server_id, 10)
  #   5.0

  """
  def start do
    spawn(fn -> loop(0) end)
  end

  defp loop(current_value) do
    new_value = receive do
      {:value, client_id} -> send(client_id, {:response, current_value})
        current_value

      {:add, value} -> current_value + value
      {:sub, value} -> current_value - value
      {:mult, value} -> current_value * value
      {:div, value} -> current_value / value

      invalid_request -> IO.puts("Invalid Request #{inspect invalid_request}")
        current_value
    end
    loop(new_value)
  end

  def value(server_id) do
    send(server_id, {:value, self()})
    receive do
      {:response, value} -> value
    end
  end

  def add(server_id, value) do
    send(server_id, {:add, value})
    value(server_id)
  end

  def sub(server_id, value) do
    send(server_id, {:sub, value})
    value(server_id)
  end

  def mult(server_id, value) do
    send(server_id, {:mult, value})
    value(server_id)
  end

  def div(server_id, value) do
    send(server_id, {:div, value})
    value(server_id)
  end
end
