Given /^I am on the homepage$/ do
  visit "lens#index"
end

When /^I select a "(.*?)"$/ do |lenstype|
  page.select(lenstype, :from => "Lens Type")
  click_button "Search"
end

Then /^I should see "(.*?)"$/ do |lens|
  page.should have_content(lens)
end
