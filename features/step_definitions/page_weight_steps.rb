Given /^a valid url for a html page$/ do
  @url = "http://localhost:3000/"
end

When /^I ask for the urls page weight$/ do
  @html_weight = PageWeight::PageWeight.of_html_for(@url)
end

Then /^the weight of the html is supplied$/ do
  @html_weight.should == 1841
end

When /^I ask for the page weight report for the specified url$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the report for the url is supplied$/ do
  pending # express the regexp above with the code you wish you had
end
