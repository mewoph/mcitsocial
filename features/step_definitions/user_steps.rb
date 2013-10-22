def create_user
	@user = {:email => "User@user.com", :first_name => "Chris", :last_name => "Murphy",
		:bio => "A really awesome bio", :matriculation_date => "2012-10-15",
		:graduation_date => "2013-05-05", :previous_work => "Professor", 
		:undergrad_major => "Computer Science", :undergrad_school => "UPenn",
		:hometown => "Philadelphia", :password => "something", 
		:password_confirmation => "something"}
end

def create_valid_user
	@user_created = FactoryGirl.create(:user, email: @user[:email], password: @user[:password],
  								password_confirmation: @user[:password_confirmation], confirmed_at: "2013-10-10 10:15:00" )
end

#Given
Given /^the following users exist:$/ do |table|
  table.hashes.each do |attributes|
    FactoryGirl.create(:user, first_name: attributes["First Name"], last_name: attributes["Last Name"], bio: attributes["Bio"], 
    	is_current_student: attributes["Is Current Student"], graduation_date: attributes["Graduation Date"],
    	 matriculation_date: attributes["Matriculation Date"], previous_work: attributes["Previous Work"],
    	 undergrad_school: attributes["Undergrad Major"], undergrad_major: attributes["Undergrad School"],
    	 password_confirmation: "pleaseplease", password: "pleaseplease", confirmed_at: "2013-10-10 10:15:00")
  end 
end

Given /^I am not a valid user$/ do
	create_user
end

Given /^I am a valid user$/ do
	create_user
	create_valid_user
end

Given /^I am logged in$/ do
	create_user
	create_valid_user
	visit root_path
	fill_in "user_email", :with => @user[:email]
	fill_in "user_password", :with => @user[:password]
	click_button "buttonid"
end

Given /^I am signed in as "(.*?)"$/ do |name|
	puts User.all
	@registeredUser = User.where(:first_name => name)[0]
	visit root_path
	fill_in "user_email", :with => @registeredUser.email
	fill_in "user_password", :with => @registeredUser.password
	click_button "buttonid"
end

#When
When /^I edit my profile information$/ do
	visit edit_user_path(@user_created.id)
	#TODO: Add edit information 
end

When /^I sign in$/ do
	visit root_path
	fill_in "user_email", :with => @user[:email]
	fill_in "user_password", :with => @user[:password]
	click_button "buttonid"
end

When /^I sign in with the incorrect password$/ do
	visit root_path
	fill_in "user_email", :with => @user[:email]
	fill_in "user_password", :with => "incorrect"
	click_button "buttonid"
end

When /^I sign in with an invalid email$/ do
	visit root_path
	fill_in "user_email", :with => "invalidemail"
	fill_in "user_password", :with => @user[:password]
	click_button "buttonid"
end

When /^I view my profile page$/ do
	visit user_path(@registeredUser.id)
end

When /^I view a profile show page$/ do
	@user = User.first
	visit user_path(@user.id)
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
	page.should have_content "Signed in successfully."
	page.should have_content "Sign out"
end

Then /^I should see my profile information$/ do
	page.should have_content @registeredUser.first_name
	page.should have_content @registeredUser.last_name
	page.should have_content @registeredUser.bio
	page.should have_content @registeredUser.previous_work
	page.should have_content @registeredUser.undergrad_major
	page.should have_content @registeredUser.undergrad_school
	page.should have_content @registeredUser.hometown
	page.should have_content @registeredUser.email
	#TODO add line to check is current student 
	#TODO add line for part time student
	#TODO add line for courses
	#TODO add line for languages
end

Then /^I should not see another users profile information$/ do
	userTwo = User.find(2)
	page.should_not have_content userTwo.first_name
	page.should_not have_content userTwo.last_name
	page.should_not have_content userTwo.bio
	page.should_not have_content userTwo.previous_work
	page.should_not have_content userTwo.undergrad_school
	page.should_not have_content userTwo.undergrad_major
	page.should_not have_content userTwo.hometown
	page.should_not have_content userTwo.email
	#TODO add line to check is current student 
	#TODO add line for part time student
	#TODO add line for courses
	#TODO add line for languages
end

Then /^I should not be able to access a profile show page$/ do
	page.should_not have_content @user.first_name
	page.should_not have_content @user.last_name
	page.should_not have_content @user.bio
	page.should_not have_content @user.previous_work
	page.should_not have_content @user.undergrad_school
	page.should_not have_content @user.undergrad_major
	page.should_not have_content @user.hometown
	page.should_not have_content @user.email
	#TODO add line to check is current student 
	#TODO add line for part time student
	#TODO add line for courses
	#TODO add line for languages
	page.should have_content "You need to sign in or sign up before continuing."
end

Then /^I should see the edit profile button$/ do
	page.should have_button "button edit-user"
end
