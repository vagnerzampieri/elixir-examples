defmodule Rectangle do
  @doc """
  ### Install

    elixirc concurrently.ex

    generate Elixir.Rectangle.beam file

  ### Examples:

    iex> a = spawn(fn -> Rectangle.area_loop() end)
    iex> send a, {:area, 35, 200}
      Area = 7000
      {:area, 35, 200}

    iex> send a, {:pmeter, 35, 200}
      pmeter = 235
      {:pmeter, 35, 200}
  """
  def area_loop do
    receive do
      {:area, w, h} ->
        IO.puts("Area = #{w*h}")
        area_loop()
      {:pmeter, w, h} ->
        IO.puts("pmeter = #{w+h}")
        area_loop()
    end
  end
end
