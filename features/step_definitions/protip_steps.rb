# Helpers

def visit_form_page
	within(".navbar") do 
		click_link "Protips"
	end
	click_link "Add a Protip"
end

def get_adder_id(name)
	User.where(:first_name => name).first.id
end

# Given
Given /^the following protips exist:$/ do |table|
  table.hashes.each do |attributes|
    FactoryGirl.create(:protip, adder_id: get_adder_id(attributes["Adder First Name"]), title: attributes["Title"], content: attributes["Content"], category: attributes["Category"])
  end 
end

# When

When /^I click on protips link in the nav bar$/ do
	within(".navbar") do
		click_link "Protips"
	end
end

When /^I click on the add protips link$/ do
	click_link "Add a Protip"
end

When /^I create a protip with title "(.*?)", content "(.*?)", and category "(.*?)"$/ do |protip_title, protip_content, protip_category|
	visit_form_page
	# save_and_open_page
	fill_in "protip_title", :with => protip_title
	fill_in "protip_content", :with => protip_content
	page.select(protip_category, :from => "protip_category")
end

When /^I click create protip button$/ do
	click_button "Create Protip"
end

When /^I click cancel button$/ do
	click_link "Cancel"
end

When /^I create a protip with content "(.*?)", category "(.*?)", and with no title$/ do |protip_content, protip_category|
	visit_form_page
	fill_in "protip_content", :with => protip_content
	page.select(protip_category, :from => "protip_category")
end

When /^I create a protip with title "(.*?)", content "(.*?)", and do not choose a category$/ do |protip_title, protip_content|
	visit_form_page
	fill_in "protip_title", :with => protip_title
	fill_in "protip_content", :with => protip_content
end

When /^I create a protip with title "(.*?)", category "(.*?)", and with no content$/ do |protip_title, protip_category|
	visit_form_page
	fill_in "protip_title", :with => protip_title
	page.select(protip_category, :from => "protip_category")
end

# Then

Then /^I should be able to enter protips title$/ do
	visit_form_page
	fill_in "protip_title", :with => "Something"
end

Then /^I should be able to enter protips content$/ do
	visit_form_page
	fill_in "protip_content", :with => "This is a content."
end

Then /^I should see a success protip created message$/ do
	page.should have_content "Protip Created"
end

Then /^I should see the protip show page with the title "(.*?)" and content "(.*?)" and my name as adder name$/ do |protip_title, protip_content|
	page.should have_content protip_title
	page.should have_content protip_content
	#TODO - refine this
end

Then /^I should be redirected back to protips index page$/ do
	page.should have_css(".protips-index")
end

Then /^I should see a protip creation error message$/ do 
	page.should have_content "Please complete the form."
end

Then /^The protip with content "(.*?)" should not exist$/ do |protip_content|
end

Then /^The protip with title "(.*?)" should not exist$/ do |protip_title|
	#TODO - how to check whether a protip doesn't exist in the database
	# click all four categories, make sure the tip doesn't exist?
end
