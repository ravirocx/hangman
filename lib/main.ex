defmodule Main do
	use GenServer
	alias DataParser

	def start_link do
	GenServer.start_link(__MODULE__, %{}, name: :hangman_main)		
	end

	def init(_) do
		{:ok, DataParser.parse_data()}
	end

	def start_me() do
		GenServer.call(:hangman_main, {:start_me}, 500000 )
	end

	def handle_call({:start_me}, _from, random_word_data ) do
		answer = Body.first_time(random_word_data)
		{:reply, answer, random_word_data}
	end
end