defmodule Body do
	def hangme(accumulator) do
    case accumulator do
      0 -> IO.puts ""
      1 ->IO.puts "  ________
  |      |
  |       
  |
  |
__|__
            "
      2 -> IO.puts "  ________
  |      |
  |      O 
  |
  |
__|__
            "
      3 -> IO.puts "  ________
  |      |
  |      O
  |      |
  |
__|__
            "
      4 -> IO.puts "  ________
  |      |
  |    __O__
  |      |
  |
__|__
            "
            
    end
  end
  def find_me(secret_word, guess) do
    Enum.with_index(secret_word) |> Enum.filter_map(fn {x, _} -> x == guess end, fn {_, i} -> i end)
   end

	def run_everytime(secret_word, secret_word, accumulator, used_letters) do
    IO.puts "********Congratulutaions********"
    "The correct answer as you guessed is #{secret_word}"
  end
  def run_everytime(secret_word, solution, 5, used_letters) do
   IO.puts "  ________
  |      |
  |    __@__
  |      |
  |     / \\  
__|__  
            "
    IO.puts "********Game Over Boy********"

    "The correct answer is #{secret_word}"
    
  end

  def replaceme(solution, guess, []) do
    solution
  end

  def replaceme(solution, guess, [head | tail]) do
    #IO.puts head
    solution=List.replace_at(solution,head,guess)
    replaceme(solution, guess, tail)
  end

	def run_everytime(secret_word, solution, accumulator, used_letters) do
		hangme(accumulator)
		guess= String.trim(IO.gets "input ")
    if guess in used_letters do
      IO.puts "That's already used boy\n"
      IO.puts solution
      IO.puts "you have used: #{used_letters} \n \n"
      run_everytime(secret_word, solution, accumulator, used_letters)
    end
    list_of_index=find_me(secret_word,guess)
    if list_of_index==[] do
      accumulator=accumulator+1
    else
      solution=replaceme(solution,guess,list_of_index)
    end
    used_letters=used_letters ++ [guess]
    used_letters=used_letters ++ [" "]
    IO.puts solution
    IO.puts "you have used: #{used_letters} \n \n"
    run_everytime(secret_word, solution, accumulator, used_letters)
	end

	def first_time(secret_word) do
		solution = String.duplicate("-", length(secret_word))
		|> String.graphemes

		IO.puts solution
		used_letters=[]
		run_everytime(secret_word, solution, 0, used_letters)

	end
end