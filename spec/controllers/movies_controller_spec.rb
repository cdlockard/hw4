require 'spec_helper'

describe MoviesController do

	describe 'edit director' do

		before :each do
			@fake_movie = mock('movie1')
			@fake_movie.stub(:title).and_return('fake')
			@fake_movie.stub(:id).and_return(1)
		end
		it 'should call the model method to update attributes' do
			Movie.stub(:find).and_return(@fake_movie)
			@fake_movie.should_receive(:update_attributes!).with("director" => 'Steven Spielberg')
			put :update, {:movie => {:director => 'Steven Spielberg'}, :id=>@fake_movie.id}
		end
	end
end

