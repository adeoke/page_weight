When /^I ask for the javascript page weight$/ do
  @javascript_weight = PageWeight::PageWeight.of_javascript_for(@url)
end

Then /^the javascript weight is supplied$/ do
  @javascript_weight.should == 25809
end

When /^I ask for the number of javascript documents for that url$/ do
  @javascript_files = PageWeight::PageWeight.javascript_files_count_for(@url)
end

Then /^the number of javascript documents is supplied$/ do
  @javascript_files.should == 1
end
