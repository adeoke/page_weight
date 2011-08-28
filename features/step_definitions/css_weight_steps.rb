When /^I ask for the CSS weight$/ do
  @css_weight = PageWeight::PageWeight.of_css_for(@url)
end

Then /^the CSS weight is supplied$/ do
  @css_weight.should == 404
end

When /^I ask for the number of CSS files for that url$/ do
  @css_files = PageWeight::PageWeight.css_files_count_for(@url)
end

Then /^the number of CSS files is supplied$/ do
  @css_files.should == 1
end
