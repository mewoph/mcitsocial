
#When

When /^I view a question show page$/ do
	puts "WE GOT HERE IN THIS PLACE OMG"
	puts Feedback.all
	@feedback = Feedback.first
	visit feedback_path(@feedback)
end

#Then

Then /^I should see the feedback information$/ do
  page.should have_content @feedback.feedback_content
  page.should have_content Users.find(@feedback.adder_id)[0].first_name
  page.should have_content Users.find(@feedback.adder_id)[0].last_name
  page.should have_content @feedback.created_at
end

