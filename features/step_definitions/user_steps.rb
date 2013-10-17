def create_user
	@user = {:email => "User@user.com", :first_name => "Chris", :last_name => "Murphy",
		:bio => "A really awesome bio", :matriculation_date => "2012-10-15",
		:graduation_date => "2013-05-05", :previous_work => "Professor", 
		:undergrad_major => "Computer Science", :undergrad_school => "UPenn",
		:hometown => "Philadelphia", :password => "something", 
		:password_confirmation => "something"}
end

#Given
Given /^I am not a valid user$/ do
	create_user
end

Given /^I am a valid user$/ do
	create_user
  @user_created = FactoryGirl.create(:user, email: @user[:email], password: @user[:password],
  								password_confirmation: @user[:password_confirmation], confirmed_at: "2013-10-10 10:15:00" )
end


#When
When /^I sign in$/ do
	visit new_user_session_path
	fill_in "user_email", :with => @user[:email]
	fill_in "user_password", :with => @user[:password]
	click_button "buttonid"
end

When /^I sign in with the incorrect password$/ do
	visit new_user_session_path
	fill_in "user_email", :with => @user[:email]
	fill_in "user_password", :with => "incorrect"
	click_button "buttonid"
end

When /^I sign in with an invalid email$/ do
	visit new_user_session_path
	fill_in "user_email", :with => "invalidemail"
	fill_in "user_password", :with => @user[:password]
	click_button "buttonid"
end

#Then
Then /^I should be able to login successfully$/ do
	page.should have_content "Signed in successfully"
end

Then /^I should not be able to login succesfully$/ do
	page.should have_content "Invalid email or password"
end

Then /^I should not have access to the private content$/ do
	page.should_not have_content "Signed in successfully"
end

Then /^I should see an error message$/ do
	page.should have_content "Invalid email or password"
end

Then /^I should have access to the private content$/ do
	#TODO: Make sure that this is updated with updated landing page content
	page.should have_content "Here are all the users!"
	page.should have_content "Sign out"
end