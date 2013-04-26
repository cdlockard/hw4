require 'spec_helper'
describe Movie do
	it 'can add director to a movie' do
		movie=Movie.create!(:title => 'test movie')
		movie.update_attributes!(:director => 'test director')

		movie.director.should == 'test director'
	end
end