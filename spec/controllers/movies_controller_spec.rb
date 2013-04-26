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

	describe 'find movies with same director' do
		before :each do
			@fake_movie = mock('movie1')
			@fake_movie.stub(:title).and_return('fake')
			@fake_movie.stub(:id).and_return(1)
			@fake_movie.stub(:director).and_return('Steven Spielberg')
			@mov1=Movie.create!(:title => 'test1', :director => 'Steven Spielberg')
		end
		it 'should call Movie model method to find matching movies' do
			Movie.should_receive(:find_all_by_director).with(@fake_movie.director).and_return(@fake_movie)
			get :find_by_director, {:id => @fake_movie.id}
		end

		it 'should render the template for displaying matches' do
			
			get :find_by_director, {:id => '1'}
			response.should render_template('find_by_director')
		end
		it 'should make matching results available to the template' do
			movie_list = mock('movie list')
			Movie.stub(:find_all_by_director).and_return(movie_list)
			get :find_by_director, {:id => '1'}
			assigns(:movies).should == movie_list
		end

	end

end

