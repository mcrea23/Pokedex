class Api

  def pokemon_creator
    url = "https://pokeapi.co/api/v2/pokemon?limit=151"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response.body
    @pokemon_data = JSON.parse(response.body)
    @pokemon = @pokemon_data["results"].collect do |pokemon|
      pokemon
    end
    @pokemon.each do |pokemon|
      pokemons = "https://pokeapi.co/api/v2/pokemon/#{pokemon["name"]}"
      poke_uri = URI.parse(pokemons)
      responses = Net::HTTP.get_response(poke_uri)
      responses.body
      pokemon_data = JSON.parse(responses.body)
      Pokemon.create(name: pokemon_data["name"]) 
    end
  end
end