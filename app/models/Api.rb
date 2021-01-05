class Api

  def pokemon_creator
    url = "https://pokeapi.co/api/v2/pokemon?limit=151"
    uri = URI.parse(url)
    reponse = Net::HTTP.get_response(uri)
    response.body

    @pokemon_data = JSON.parse(response.body)
  end
end