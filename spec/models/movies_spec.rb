require 'spec_helper'
describe Movie do
	it 'can add director to a movie' do
		movie=Movie.create!(:title => 'test movie')
		movie.update_attributes!(:director => 'test director')

		movie.director.should == 'test director'
	end

	it 'can find movies by the same director as a given movie' do
		movie1=Movie.create!(:title => "2046", :director => "Wong Kar-wai")
		movie2=Movie.create!(:title => "Before Sunrise", :director => "Richard Linklater")
		movie3=Movie.create!(:title => "Chungking Express", :director => "Wong Kar-wai")
		movies=Movie.find_same_director(movie3)
		movies.should =~ [movie1, movie3]
	end
end