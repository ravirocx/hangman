defmodule Main do
	use GenServer
	alias DataParser

	def start_link do
	GenServer.start_link(__MODULE__, %{}, name: :hangman_main)		
	end

	def init(_) do
		{:ok, DataParser.parse_data()}
	end

	def get_random_word() do
		GenServer.call(:hangman_main, {:get_random_word}, 500000 )
	end

	def handle_call({:get_random_word}, _from, random_word_data ) do
		answer = Body.first_time(random_word_data)
		{:reply, answer, random_word_data}
	end
end