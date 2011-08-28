Given /^a valid url for a html page$/ do
  @url = "http://localhost:3000/"
end

When /^I ask for the urls page weight$/ do
  @page_weight = PageWeight::PageWeight.of_html_for(@url)
end

Then /^the weight of the html is supplied$/ do
  @page_weight.should == 1837
end

When /^I ask for the page weight report for the specified url$/ do
  @report = PageWeight::PageWeight.report_for(@url)
end

Then /^the report for the url is supplied$/ do
  @report[:html].should == 1837
  @report[:javascript].should == 25809
  @report[:number_of_javascript_files].should == 1
  @report[:css].should == 404
  @report[:number_of_css_files].should == 1
  @report[:flash].should == 166688
  @report[:number_of_flash_files].should == 2
  @report[:images].should == 85176
  @report[:number_of_images_files].should == 3
  @report[:total_weight].should == 279921
end