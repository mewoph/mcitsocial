
#When

When /^I view a question show page$/ do
	@feedback = Feedback.first
	visit feedback_path(@feedback)
end

#Then

Then /^I should see the feedback information$/ do
  user = User.where(:id => @feedback.adder_id)[0];
  page.should have_content @feedback.feedback_content
  page.should have_content user.first_name
  page.should have_content user.last_name
  page.should have_content @feedback.get_created_time
end

