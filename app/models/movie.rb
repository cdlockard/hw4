class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  #Colin added method to find movies with same director as movie passed in
  def self.find_same_director(movie)
  	return Movie.find_all_by_director(movie.director)
  end

end
