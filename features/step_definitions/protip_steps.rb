#Given


#When

When /^I click on the protips link in the nav bar$/ do
	within(".navbar") do
		click_link "Protips"
	end
end

When /^I click on the add protips link$/ do
	click_link "Add a Protip"
end

#Then

Then /^I should be able to enter protips title$/ do
	fill_in "Title", :with => "Something"
end