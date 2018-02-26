defmodule HangmanTest do
  use ExUnit.Case
  doctest Hangman

  test "Checking Supervisor" do
  	assert elem(Hangman.start(), 0) == :ok
  end

  test "Checking Data Parser" do
  	list_of_words=["UZI", "TAVOR", "INSAS", "GLOCK", "CARBINE", "GALIL", "KALASHNIKOVA", "DRAGUNAV", "CHETAK", "TEJAS", "SUKHOI", "ARJUN", "RAFALE", "VIKRAMADTIYA", "STALLION", "AGNI", "BRAHMOS", "PINAKA", "ARIHANT", "PRITHVI", "GLOBEMASTER", "BARAK"]
    assert List.to_string(DataParser.parse_data()) in list_of_words
  end

  test "Checking Replace Function" do
  	assert Body.replaceme(["_", "_", "_", "_", "_"],"a",[1, 2, 3]) == ["_", "a", "a", "a", "_"]
  	assert Body.replaceme(["_", "_", "_", "_", "_"],"a",[0, 3, 2]) == ["a", "_", "a", "a", "_"]
  	assert Body.replaceme(["_", "_", "_", "_", "_"],"a",[3, 2, 1]) == ["_", "a", "a", "a", "_"]
  end

  test "checking find_me function" do
  	assert Body.find_me(["C", "A", "R", "B", "I", "N", "E"], "C") == [0]
  	assert Body.find_me(["G", "A", "L", "I", "L"], "L") == [2, 4]
  end

  test "checking run_every_time function when player wins" do
  	assert Body.run_everytime(["G", "A", "L", "I", "L"], ["G", "A", "L", "I", "L"], 2, ["O", "P"]) == "The correct answer as you guessed is GALIL"
  	assert Body.run_everytime(["C", "A", "R", "B", "I", "N", "E"], ["C", "A", "R", "B", "I", "N", "E"], 2, ["O", "P"]) == "The correct answer as you guessed is CARBINE"
  end

  test "checking run_every_time function when player looses" do
  	assert Body.run_everytime(["G", "A", "L", "I", "L"], ["G", "-", "-", "I", "L"], 5, ["O", "P"]) == "The correct answer is GALIL"
  	assert Body.run_everytime(["C", "A", "R", "B", "I", "N", "E"], ["-", "A", "R", "-", "I", "N", "E"], 5, ["O", "P"]) == "The correct answer is CARBINE"
  end

  
end
