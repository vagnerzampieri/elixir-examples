# Mylist.len([1,2,3,4])
defmodule Mylist do
    def len(nil), do: 0
    def len([]), do: 0
    def len([_head | tail]), do: 1 + len(tail)
end