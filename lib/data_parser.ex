defmodule DataParser do
	def parse_data() do
		##will parse data
		list = ["TAVOR", "INSAS", "GLOCK", "CARBINE", "GALIL", "KALASHNIKOVA", "DRAGUNAV", "CHETAK", "TEJAS", "SUKHOI", "ARJUN", "RAFALE", "VIKRAMADTIYA", "STALLION"]
    Enum.random(list)
    |> String.graphemes
    
	end
end

IO.puts DataParser.parse_data()