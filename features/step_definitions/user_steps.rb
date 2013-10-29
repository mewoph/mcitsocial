def create_user
	create_password
	@user = {:email => "User@user.com", :first_name => "Chris", :last_name => "Murphy",
		:bio => "A really awesome bio", :matriculation_date => "2012-10-15",
		:graduation_date => "2013-05-05", :previous_work => "Professor", 
		:undergrad_major => "Computer Science", :undergrad_school => "UPenn",
		:hometown => "Philadelphia", :password => @password, 
		:password_confirmation => @password, :languages => "HTML, JavaScript, Ruby",
		:interests => "Hockey, Programming", :courses => "CIS 573, CIS 555"
	}
end

def create_password
	@password = "pleaseplease"
end

def create_valid_user
	@user_created = FactoryGirl.create(:user, email: @user[:email], password: @user[:password],
  								password_confirmation: @user[:password_confirmation], confirmed_at: "2013-10-10 10:15:00" )
end

def my_profile
	page.should have_content @original_user.first_name
	page.should have_content @original_user.last_name
	page.should have_content @original_user.bio
	page.should have_content @original_user.previous_work
	page.should have_content @original_user.undergrad_major
	page.should have_content @original_user.undergrad_school
	page.should have_content @original_user.hometown
	page.should have_content @original_user.email
	#TODO add line to check is current student 
	#TODO add line for part time student
	#TODO add line for courses
	#TODO add line for languages
end

#Given
Given /^the following users exist:$/ do |table|
  create_password
  table.hashes.each do |attributes|
    FactoryGirl.create(:user, first_name: attributes["First Name"], last_name: attributes["Last Name"], bio: attributes["Bio"], 
    	is_current_student: attributes["Is Current Student"], graduation_date: attributes["Graduation Date"],
    	 matriculation_date: attributes["Matriculation Date"], previous_work: attributes["Previous Work"],
    	 undergrad_school: attributes["Undergrad Major"], undergrad_major: attributes["Undergrad School"],
    	 password_confirmation: @password, password: @password, confirmed_at: "2013-10-10 10:15:00")
  end 
  puts User.all
end

Given /^I am not a valid user$/ do
	create_password
	create_user
end

Given /^I am a valid user$/ do
	# create_password
	create_user
	create_valid_user
end

Given /^I am logged in$/ do
	# create_password
	create_user
	create_valid_user
	visit root_path
	fill_in "user_email", :with => @user[:email]
	fill_in "user_password", :with => @user[:password]
	click_button "buttonid"
end

Given /^I am logged in as "(.*?)"$/ do |name|
	# create_password
	@original_user = User.where(:first_name => name)[0]
	visit root_path
	fill_in "user_email", :with => @original_user[:email]
	fill_in "user_password", :with => @password
	click_button "buttonid"
end


#When
When /^I edit my profile information$/ do
	create_user
	visit edit_user_path(@original_user.id)
	#attach profile picture
	# within "#user_profile_picture" do
	# 	attach_file("file", "#{Rails.root}/features/fixtures/test.jpg")
	# end
	puts "ASDFSADF #{@user[:first_name]}"
	fill_in "First Name", :with => "Honolulu"
	fill_in "user_last_name", :with => @user[:last_name]
	fill_in "user_email", :with => @user[:email]
	fill_in "user_email", :with => @user[:hometown]
	fill_in "user_matriculation_date", :with => @user[:matriculation_date]
	fill_in "user_graduation_date", :with => @user[:graduation_date]
	fill_in "user_undergrad_major", :with => @user[:undergrad_major]
	fill_in "user_undergrad_school", :with => @user[:undergrad_school]
	fill_in "user_bio", :with => @user[:bio]
	fill_in "user_languages", :with => @user[:languages]
	fill_in "user_courses", :with => @user[:courses]
	fill_in "user_areas_of_interest", :with => @user[:interests]
	fill_in "user_previous_work", :with => @user[:previous_work]
	click_button "Save Profile"
end

When /^I sign in$/ do
	# create_password
	visit root_path
	fill_in "user_email", :with => @user[:email]
	fill_in "user_password", :with => @user[:password]
	click_button "buttonid"
end

When /^I sign in with the incorrect password$/ do
	# create_password
	visit root_path
	fill_in "user_email", :with => @user[:email]
	fill_in "user_password", :with => "incorrect"
	click_button "buttonid"
end

When /^I sign in with an invalid email$/ do
	# create_password
	visit root_path
	fill_in "user_email", :with => "invalidemail"
	fill_in "user_password", :with => @user[:password]
	click_button "buttonid"
end

When /^I view my profile page$/ do
	visit user_path(@original_user.id)
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

Then /^I should see a successful profile edited message$/ do
	page.should have_content "Profile updated"
end	

Then /^I should see the updated profile information$/ do
	puts page.body
	page.should have_selector("img[src$='test.jpg']")
	page.should have_content @user[:first_name]
	page.should have_content @user[:last_name]
	page.should have_content @user[:hometown]
	page.should have_content @user[:email]
	page.should have_content @user[:matriculation_date].strftime("%B %Y")
	page.should have_content @user[:graduation_date].strftime("%B %Y")
	page.should have_content @user[:undergrad_major]
	page.should have_content @user[:undergrad_school]
	page.should have_content @user[:bio]
	page.should have_content @user[:courses]
	page.should have_content @user[:languages]
	page.should have_content @user[:interests]
	page.should have_content @user[:previous_work]
end

Then /^I should have access to the private content$/ do
	#TODO: Make sure that this is updated with updated landing page content
	page.should have_content "Signed in successfully."
	page.should have_content "Sign out"
end

Then /^I should see my profile information$/ do
	page.should have_content @original_user.first_name
	page.should have_content @original_user.last_name
	page.should have_content @original_user.bio
	page.should have_content @original_user.previous_work
	page.should have_content @original_user.undergrad_major
	page.should have_content @original_user.undergrad_school
	page.should have_content @original_user.hometown
	page.should have_content @original_user.email
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
