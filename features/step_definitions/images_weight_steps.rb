When /^I ask for the images page weight$/ do
  @images_weight = PageWeight::PageWeight.of_images_for(@url)
end

Then /^the images weight is supplied$/ do
  @images_weight.should == 85176
end

When /^I ask for the number of images for that url$/ do
  @image_count = PageWeight::PageWeight.number_of_images_for(@url)
end

Then /^the number of images is supplied$/ do
  @image_count.should == 3
end
