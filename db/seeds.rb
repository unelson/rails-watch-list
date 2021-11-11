require 'pry'
require 'uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Movie.destroy_all
 url = 'http://tmdb.lewagon.com/movie/top_rated?page=2'
 json = URI.open(url).read
 data = JSON.parse(json)
 data['results'].each do |result|
  movie = Movie.new
  movie.poster_url = "https://image.tmdb.org/t/p/w500#{result['poster_path']}"
  movie.title = result['original_title']
  movie.overview = result['overview']
  movie.rating = result['vote_average']
  movie.save
 end
