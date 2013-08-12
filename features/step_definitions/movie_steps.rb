# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    #debugger
    Movie.create(movie)
    #end
  end
  #flunk "Unimplemented"
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |arg1, arg2|
  #pending # express the regexp above with the code you wish you had
  #breakpoint
  m = Movie.find_by_title(arg1)
  #debugger
  assert(!m.nil? && (m.director == arg2))
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  #debugger
  pose1 = page.body.index(e1)
  pose2 = page.body.index(e2)
  passed = (!pose1.nil?) && (!pose2.nil?) && (pose1.should be < pose2)
  #debugger
  assert passed #?, "Not sorted correctly"
  #debugger
  #flunk "Unimplemented"
end
