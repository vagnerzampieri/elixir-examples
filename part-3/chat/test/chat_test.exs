defmodule ChatTest do
  use ExUnit.Case
  doctest Chat.Server

  describe "#add_msg" do
    test "returns added menssage" do
      Chat.Server.add_msg "Hello"
      assert Chat.Server.get_msgs == ["Hello"]
    end
  end
end
