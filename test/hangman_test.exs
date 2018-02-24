defmodule HangmanTest do
  use ExUnit.Case
  doctest Hangman

  test "Checking Supervisor" do
    assert {:ok, _}==Hangman.start() 
  end
end
