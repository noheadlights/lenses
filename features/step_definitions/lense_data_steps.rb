
Given /^I am logged in$/ do

  visit "lens#index"
  click_on "Login"
  fill_in 'Email', with: 'admin@lenses.com'
  fill_in 'Password', with: 'secret'
  click_on "Sign in"


end

Given /^the Test Lense doesn't exist$/ do
  if Lense.find_by_name"EF Test"
    Lense.delete(Lense.find_by_name"EF Test")
  end

end
And /^I select "(.*?)" from "(.*?)"$/ do |arg1, arg2|
  select arg1, from: arg2
end


And /^I fill in "(.*?)" with "(.*?)"$/ do |arg1, arg2|
  fill_in arg1, with: arg2
end

Then /^a new Record should be saved$/ do
  Lense.all.count.should == (@c+1)
end
