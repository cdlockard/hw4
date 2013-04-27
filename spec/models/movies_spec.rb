require 'spec_helper'
#Colin added 4/23:
describe Movie do
	it 'can add director to a movie' do
		movie=Movie.create!(:title => 'test movie')
		movie.update_attributes!(:director => 'test director')

		movie.director.should == 'test director' #perform the test
	end

#Colin added 4/25:
	it 'can find movies by the same director as a given movie' do
		movie1=Movie.create!(:title => "2046", :director => "Wong Kar-wai")
		movie2=Movie.create!(:title => "Before Sunrise", :director => "Richard Linklater")# add none-matching record to confirm it is not found
		movie3=Movie.create!(:title => "Chungking Express", :director => "Wong Kar-wai")
		movies=Movie.find_same_director(movie3)
		movies.should =~ [movie1, movie3] #perform the test
	end
end