def create_user
	@user = {:email => "User@user.com", :first_name => "John", :last_name => "Smith",
		:bio => "A really awesome bio", :matriculation_date => "2012-10-15",
		:graduation_date => "2013-05-05", :previous_work => "Professor", 
		:undergrad_major => "Computer Science", :undergrad_school => "UPenn",
		:hometown => "Philadelphia", :password => "something", 
		:password_confirmation => "something"}
end

def sign_in
	visit root_path
	fill_in "user_email", :with => @user[:email]
	fill_in "user_password", :with => @user[:password]
	click_button "buttonid"
end


#Given
Given /^I am a valid user that is logged in$/ do
	create_user
	sign_in
end

Given /^the following companies exist:$/ do |table|
  table.hashes.each do |attributes|
    FactoryGirl.create(:company, name: attributes["name"])
  end 
end

Given /^the following questions exist:$/ do |table|
  table.hashes.each do |attributes|
    FactoryGirl.create(:question, question: attributes["question"])
  end 
end

#When
When /^I click on the companies tab$/ do
	within(".navbar") do
		click_link "companies"
	end
end

When /^I view the company "(.*?)"$/ do |name|
    @original_company = Company.where(:name => name)[0]
    visit company_path(@original_company.id)
end

When /^I create the company "(.*?)"$/ do |name|
	visit new_company_path
	fill_in "company_name", :with => "Google"
	click_button "submit_button"
end

#Then
Then /^I should see a list of all existing companies$/ do
	page.should have_content "Microsoft"
	page.should have_content "Amazon"
end

Then /^I should see all of "(.*?)"s company information$/ do |name|
	page.should have_content @original_company.name
end