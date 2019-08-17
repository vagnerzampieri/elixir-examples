# import WeatherHistory
# for_location(test_data, 27)
defmodule WeatherHistory do
    def test_data do
        [
            [123, 26, 20, 0.44],
            [123, 27, 15, 0.122],
            [123, 26, 13, 0.111],
            [123, 26, 18, 0.125],
            [123, 27, 14, 0.25],
            [123, 26, 14, 0.50],
            [123, 28, 22, 0.12]            
        ]
    end

    def for_location([], target_location), do: []
    def for_location([head = [_, target_location, _, _] | tail], target_location) do
        [head | for_location(tail, target_location)]
    end
    def for_location([_ | tail], target_location), do: for_location(tail, target_location)
end