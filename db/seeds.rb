require "json"
require "open-uri"
require "faker"

url = "http://tmdb.lewagon.com/movie/top_rated"
poster_serialized = URI.open(url).read
poster = JSON.parse(poster_serialized)

paths = []
  poster["results"].each do |po|
    var = po['poster_path']
    paths << "https://image.tmdb.org/t/p/w500#{var}"
  end


10.times do
  paths[0..11].each do |po|
    Movie.create(title: Faker::Movie.title, overview: Faker::Movie.quote, poster_url: po)
  end
end
