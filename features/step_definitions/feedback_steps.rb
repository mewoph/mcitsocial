
#When

When /^I view a question show page$/ do
	@feedback = Feedback.find(1)
	visit feedback_path(@feedback);
end

#Then

Then /^I should see the feedback information$/ do
  page.should have_content @feedback.feedback_content
  page.should have_content @feedback.adder_id
  page.should have_content @feedback.created_at
end

