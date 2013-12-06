#Given

Given /^the following comments exist:$/ do |table|
  table.hashes.each do |attributes|
    FactoryGirl.create(:comment, comment: attributes["comment"], content_id: attributes["content_id"], 
    	commenter_id: attributes["commenter_id"])
  end 
end

#When

When /^I view "(.*?)" question show page$/ do |question|
  @feedback = Feedback.where(:feedback_content => question)[0]
	visit feedback_path(@feedback)
end

When /^I like answer "(.*?)"$/ do |comment|
	@comment = Comment.where(:comment => comment)[0]
  	@likes = within(".like")
  	within(".likes") do
		click_link "kudos"
	end
end

When /^I unlike a previously liked answer "(.*?)"$/ do |comment|
  @comment = Comment.where(:comment => comment)
  	within(".likes") do
		click_link "kudos"
	end
	@likes = within(".like")
	within(".likes") do
		click_link "undo"
	end
end

#Then

Then /^I should see a list of all comments to that question$/ do
	comments = Comment.where(:content_id => @feedback.id)
	comments.each do | comment| 
		user = User.where(:id => comment.commenter_id)[0]
		page.should have_content comment.comment
		page.should have_content user.first_name
		page.should have_content user.last_name
		page.should have_content comment.get_created_time
	end
end

Then /^I should see the number of likes for answer "(.*?)" increase$/ do |arg1|
  @likes < within(".like")
end

Then /^I should see the number of likes for answer "(.*?)" decrease$/ do |arg1|
	@likes > within(".like")
end