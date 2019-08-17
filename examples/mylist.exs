# Mylist.len([1,2,3,4])
# Mylist.square([1,2,3,4])
# Mylist.map([1,2,3], fn(n) -> n*n end)
# Mylist.map([1,2,3], &(&1*&1))
defmodule Mylist do
    def len(nil), do: 0
    def len([]), do: 0
    def len([_head | tail]), do: 1 + len(tail)

    def square(nil), do: []
    def square([]), do: []
    def square([head | tail]), do: [head*head | square(tail)]

    def map(nil), do: []
    def map([], _func), do: []
    def map([head | tail], func), do: [func.(head) | map(tail, func)]
end