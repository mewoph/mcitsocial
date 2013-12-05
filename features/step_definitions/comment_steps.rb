#Given

Given /^the following comments exist:$/ do |table|
  table.hashes.each do |attributes|
    FactoryGirl.create(:comment, comment: attributes["comment"], content_id: attributes["content_id"], 
    	commenter_id: attributes["commenter_id"])
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
		page.should have_content comment.created_at
	end
end
  
