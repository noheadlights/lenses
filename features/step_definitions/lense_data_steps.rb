
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

Given /^three example lenses are in the database$/ do
  brand= Brand.find_by_name('Canon')

  @efs55250=Lense.create!(min_aperture: 3.5,
                          max_aperture: 6.3,
                          min_focal_length: 55,
                          max_focal_length: 250,
                          name: "EFS 55-250",
                          notes: "Testnote",
                          brand: brand,
                          lense_type: LenseType.find_by_lense_type("Telezoom"))

  @ef1020=Lense.create!(min_aperture: 3.5,
                        max_aperture: 5.3,
                        min_focal_length: 10,
                        max_focal_length: 20,
                        name: "EF 10-20",
                        notes: "Testnote",
                        brand: brand,
                        lense_type: LenseType.find_by_lense_type("Ultra-Wide"))


  @efs1855=Lense.create!(min_aperture: 3.5,
                         max_aperture: 5.8,
                         min_focal_length: 18,
                         max_focal_length: 55,
                         name: "EFS 18-55",
                         notes: "Testnote",
                         brand: brand,
                         lense_type: LenseType.find_by_lense_type("Wide"))

end