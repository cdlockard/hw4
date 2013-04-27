require 'spec_helper'

describe MoviesController do

	describe 'edit director' do
		#Colin added:
		before :each do
			@fake_movie = mock('movie1')
			@fake_movie.stub(:title).and_return('fake')
			@fake_movie.stub(:id).and_return(1)
		end
		it 'should call the model method to update attributes' do
			Movie.stub(:find).and_return(@fake_movie)
			@fake_movie.should_receive(:update_attributes!).with("director" => 'Steven Spielberg')
			put :update, {:movie => {:director => 'Steven Spielberg'}, :id=>@fake_movie.id} #performs the test
		end


	end

	describe 'find movies with same director' do
		#Colin added:
		before :each do
			@mov1=Movie.create!(:title => 'test1', :director => 'Steven Spielberg')
		end
		it 'should call Movie model method to find matching movies' do
			movie_list = mock('movie list')
			Movie.should_receive(:find_same_director).with(@mov1).and_return(movie_list)
			get :find_by_director, {:id => @mov1.id} #performs the test
		end

		it 'should render the template for displaying matches' do
			
			get :find_by_director, {:id => '1'}
			response.should render_template('find_by_director') #performs the test
		end
		it 'should make matching results available to the template' do
			movie_list = mock('movie list')
			Movie.stub(:find_same_director).and_return(movie_list)
			get :find_by_director, {:id => '1'}
			assigns(:movies).should == movie_list#performs the test
		end

	end

	describe 'fail to find movies by a null director' do
		#Colin added:
		before :each do
			@mov1=Movie.create!(:title => 'test1')
			@mov2=Movie.create!(:title => 'test2', :director => 'Federico Fellini')
			@mov3=Movie.create!(:title => 'test3')
		end

		it 'should not call Movie model method to find matching movies' do
			movie_list = mock('movie list')
			Movie.should_not_receive(:find_same_director).with(@mov1).and_return(movie_list)
			get :find_by_director, {:id => @mov1.id} #performs the test
		end


		
	end

end

