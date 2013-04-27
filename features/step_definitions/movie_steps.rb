Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    #Colin added 3/22:
    Movie.create(movie)
  end
end

#Colin added 4/24:
Then /^the director of "([^\"]*)" should be "([^\"]*)"$/ do |movie, director|
  Movie.find_by_title(movie).director.should == director
end