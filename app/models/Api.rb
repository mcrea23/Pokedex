class Api

  def pokemon_creator
    url = "https://pokeapi.co/api/v2/pokemon?limit=1"
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
      Pokemon.create(name: pokemon_data["name"], pokemon_type: pokemon_data["types"][0]["type"]["name"], height: pokemon_data["height"], sprite: pokemon_data["sprites"]["front_default"]) 
    end
  end
end