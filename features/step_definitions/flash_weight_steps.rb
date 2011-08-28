When /^I ask for the flash page weight$/ do
  @flash_weight = PageWeight::PageWeight.of_flash_for(@url)
end

Then /^the flash weight is supplied$/ do
  @flash_weight.should == 166688
end

When /^I ask for the number of flash objects for that url$/ do
  @flash_objects = PageWeight::PageWeight.number_of_flash_objects_for(@url)
end

Then /^the number of flash objects is supplied$/ do
  @flash_objects.should == 2
end