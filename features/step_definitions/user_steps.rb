require 'factory_girl_rails'

Given /^I am on the homepage$/ do
  visit "lens#index"
end

When /^I select a "(.*?)"$/ do |lenstype|
  page.select(lenstype, :from => "lenstype_selection")
  click_button "Search"
end

Then /^I should see "(.*?)"$/ do |content|
  page.should have_content(content)
end

And /^I should not see "(.*?)"$/ do |no_content|
  page.should_not have_content(no_content)
end

When /^I am not logged in$/ do
  page.should have_content "Login"
  page.should_not have_content "Logout"
end
When /^I enter login and password$/ do
  fill_in 'Email', with: 'admin@lenses.com'
  fill_in 'Password', with: 'secret'
end
When /^I click on "([^"]*)"$/ do |arg|
  click_link "Sign in"
end
