def create_user
	create_password
	@user = {:email => "User@user.com", :first_name => "John", :last_name => "Smith",
		:bio => "A really awesome bio", :matriculation_date => "2012-10-15",
		:graduation_date => "2013-05-05", :previous_work => "Professor", 
		:undergrad_major => "Computer Science", :undergrad_school => "UPenn",
		:hometown => "Philadelphia", :password => @password, 
		:password_confirmation => @password}
end

def create_valid_user
	@user_created = FactoryGirl.create(:user, email: @user[:email], password: @user[:password],
  								password_confirmation: @user[:password_confirmation], confirmed_at: "2013-10-10 10:15:00" )
end

def sign_in
	visit root_path
	fill_in "user_email", :with => @user[:email]
	fill_in "user_password", :with => @password
	click_button "buttonid"
end

def create_password
	@password = "pleaseplease"
end

#Given
Given /^I am a valid user that is logged in$/ do
	create_user
	create_valid_user
	sign_in
end

Given /^I am an unregistered user$/ do
	create_user
end

Given /^the following companies exist:$/ do |table|
  table.hashes.each do |attributes|
    FactoryGirl.create(:company, name: attributes["name"])
  end
end

Given /^the following feedbacks exist:$/ do |table|
  table.hashes.each do |attributes|
    FactoryGirl.create(:feedback, feedback_content: attributes["feedback_content"], company_id: attributes["company_id"],
     is_question: attributes["is_question"], adder_id: attributes["adder id"])
  end 
end

#When
When /^I click on the companies tab$/ do
	within(".navbar") do
		click_link "Companies"
	end
end

When /^I view the companies index page$/ do
	visit companies_path
end

When /^I view the company "(.*?)"$/ do |name|
    @original_company = Company.where(:name => name)[0]
    visit company_path(@original_company.id)
end

When /^I create the company "(.*?)"$/ do |name|
	visit new_company_path
	fill_in "company_name", :with => name
	click_button "submit_button"
end

When(/^I click on the feedbacks tab$/) do
  within(".navbar") do
		click_link "Questions"
	end
end

#Then
Then /^I should see a list of all existing companies$/ do
	page.should have_content "Microsoft"
	page.should have_content "Amazon"
end

Then /^I should see all of "(.*?)"s company information$/ do |name|
	page.should have_content @original_company.name
end

Then /^I should see a successful company created message$/ do
	page.should have_content "Company Created"
end

Then /^I should be redirected to "(.*?)"s show page$/ do |name|
	page.should have_content name
end

Then /^I should be able to view "(.*?)" on the company index page$/ do |name|
	visit companies_path
	page.should have_content name
end

Then /^I should see a failure to create a company message$/ do
	page.should have_content "Company Already Exists"
end

Then /^I should see a message saying you must sign in$/ do
	page.should have_content "You need to sign in or sign up before continuing"
end

Then /^I should not see "(.*?)"s information$/ do |name|
	page.should_not have_content name
end

Then /^I should not see any of the companies names$/ do
	page.should_not have_content "Microsoft"
	page.should_not have_content "Amazon"
	companies = Company.all
	companies.each do |c |
		page.should_not have_content c.name
	end
end

Then /^I should be able to view all of "(.*?)"s feedbacks$/ do |name|
  page.should have_content "What is that?"
  page.should have_content "Where am I?"
  page.should have_content "What is the meaning of life?"
  company = Company.where(:name => name)[0]
  company.feedbacks.each do |f|
  	page.should have_content f.feedback_content
  end
end

Then /^I should see a login required message$/ do 
	page.should have_content "You need to sign in or sign up before continuing."
end

Then /^I should not be able to view "(.*?)"s feedbacks$/ do |company|
  company = Company.where(:name => company)[0]
  company.feedbacks.each do | f |
  	page.should_not have_content f.feedback_content

  end 
end

Then /^I should see a list of all feedbacks and the company name it belongs to$/ do
  feedback = Feedback.all
  feedback.each do | f |
  	page.should have_content f.feedback_content
  	c = Company.where(:id => f.company_id)[0]
  	page.should have_content c.name 
  end
end

Then /^I should see "(.*?)" comments and "(.*?)" questions$/ do |num_comments, num_questions|
  find('.comments-list').all("li").count.should eql(num_comments.to_i)
  find('.questions-list').all("li").count.should eql(num_questions.to_i)
end

Then /^I should see all of "(.*?)"s questions in the question section$/ do |name|
  company = Company.where(:name => name)[0]
  company.feedbacks.each do |feedback|
  	if feedback.is_question
  		find('.questions-list').should have_content feedback.feedback_content
  	else
  		find('.questions-list').should_not have_content feedback.feedback_content
  	end
  end
end


Then /^I should see all of "(.*?)"s comments in the comments section$/ do |name|
  company = Company.where(:name => name)[0]
  company.feedbacks.each do |feedback|
  	if not feedback.is_question
  		find('.comments-list').should have_content feedback.feedback_content
  	else
  		find('.comments-list').should_not have_content feedback.feedback_content
  	end
  end
end
