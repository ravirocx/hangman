defmodule HangmanTest do
  use ExUnit.Case
  doctest Hangman

  test "Checking Hangman's start Function" do
    assert Hangman.start() == {:ok, _}
  end

  #test "Checking Main's start Function" do
  #  assert {:ok, _} == Main.start_link() 
  #end

  #test "Checking Super's start Function" do
  #  assert Super.start_link() == {:ok, _}
  #end
end
