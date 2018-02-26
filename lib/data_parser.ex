defmodule DataParser do

	@loc "C:\\Users\\Ravi Raj\\Desktop\\Intern\\hangman\\words.txt"

	def parse_data() do
		##will parse data
		{result, words} = File.read(@loc) 
		case result do
		   :error -> raise ArgumentError
		   :ok -> 
		   		words_list = String.split(words, "\r\n", trim: true)
		    	Enum.random(words_list)
		    	|>String.graphemes
		end
  
	end
end

