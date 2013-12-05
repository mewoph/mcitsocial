#Given

Given /^the following subcomments exist:$/ do |table|
  table.hashes.each do |attributes|
    FactoryGirl.create(:comment, comment: attributes["comment"], content_id: attributes["content_id"], 
    	commenter_id: attributes["commenter_id"])
  end 
end

#Then

Then /^I should see a list of all subcomments to answers$/ do
	comments = Comment.where(:content_id => @feedback.id)
	comments.each do | comment| 
		subcomments = SubComment.where(:content_id => comment.id)
		subcomments.each do |subcomment |
			user = User.where(:id => subcomment.commenter_id)[0]
			page.should have_content subcomment.comment
			page.should have_content user.first_name
			page.should have_content user.last_name
			page.should have_content subcomment.created_at
		end
	end
end
  
