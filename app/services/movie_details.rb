require 'open-uri'
require 'json'

class MovieDetails
  BASE_URL = 'https://pairguru-api.herokuapp.com'.freeze
  MOVIES_API = '/api/v1/movies/'.freeze

  def call(title)
    url = BASE_URL + MOVIES_API + URI.escape(title)
    data = JSON.parse(open(url).read)['data']['attributes']
    { plot: data['plot'], rating: data['rating'].to_s, image_url: data['poster'] }
  end
end
