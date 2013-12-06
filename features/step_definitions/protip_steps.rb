# Helpers

def visit_index_page
	within(".navbar") do
		click_link "Protips"
	end
end

def visit_form_page
	visit_index_page
	within(".add-protip") do
		click_link "Add a Protip"
	end
end

def visit_show_page
	visit_index_page
	find("#phillytips").click
	within("#phillytips li:first-child") do
		first("div").click
	end
end

def get_adder_id(name)
	User.where(:first_name => name).first.id
end

def get_protip_id(title)
	Protip.where(:title => title).first.id
end

def get_protip_content(title)
	Protip.where(:title => title).first.content
end

def get_adder_name(title)
	adder_id = Protip.where(:title => title).first.adder_id
	User.where(:id => adder_id).to_s
end

def get_comment_adder_name(comment)
	commenter_id = Comment.where(:comment => comment).first.commenter_id
	User.where(:id => commenter_id).to_s
end


def get_all_comments(title)
	protip_id = Protip.where(:title => title).first.id
	comments = Comment.where(:content_id => protip_id)
	all_comments = ""
	comments.each do |comment|
		all_comments += comment
		all_comments += " "
	end
	all_comments
end

def get_all_protip_titles(category)
	protips = Protip.where(:category => category)
	all_titles = ""
	protips.each do |protip|
		all_titles += protip
		all_titles += " "
	end
end


# Given
Given /^the following protips exist:$/ do |table|
  table.hashes.each do |attributes|
  	category = Category.find_by_name attributes["Category"]
	category.id.to_s
    FactoryGirl.create(:protip, adder_id: get_adder_id(attributes["Adder First Name"]), title: attributes["Title"], content: attributes["Content"], category: category)
  end 
  # puts Protip.all
end

Given /^the following comments to protips exist:$/ do |table|
  table.hashes.each do |attributes|
    FactoryGirl.create(:comment, commenter_id: get_adder_id(attributes["Adder First Name"]), comment: attributes["Comment"], content_id: get_protip_id(attributes["Protip"]))
  end 
end


Given /^I am on a protips show page$/ do
	visit_show_page
end

# When

When /^I click on protips link in the nav bar$/ do
	within(".navbar") do
		click_link "Protips"
	end
end

When /^I click on the add protips link$/ do
	within(".add-protip") do
		click_link "Add a Protip"
	end
end

When /^I create a protip with title "(.*?)", content "(.*?)", and category "(.*?)"$/ do |protip_title, protip_content, protip_category|
	visit_form_page
	# save_and_open_page
	fill_in "protip_title", :with => protip_title
	fill_in "protip_content", :with => protip_content
	page.select(protip_category, :from => "protip_category")
end

When /^I click create protip button$/ do
	click_button "Create Protip"
end

When /^I click cancel button$/ do
	click_link "Cancel"
end

When /^I create a protip with content "(.*?)", category "(.*?)", and with no title$/ do |protip_content, protip_category|
	visit_form_page
	fill_in "protip_content", :with => protip_content
	page.select(protip_category, :from => "protip_category")
end

When /^I create a protip with title "(.*?)", content "(.*?)", and do not choose a category$/ do |protip_title, protip_content|
	visit_form_page
	fill_in "protip_title", :with => protip_title
	fill_in "protip_content", :with => protip_content
end

When /^I create a protip with title "(.*?)", category "(.*?)", and with no content$/ do |protip_title, protip_category|
	visit_form_page
	fill_in "protip_title", :with => protip_title
	page.select(protip_category, :from => "protip_category")
end

When /^I click on the "(.*?)" category$/ do |category|
	visit_index_page
	click_link category
end

When /^I click the protip with title "(.*?)"$/ do |protip_title|
	click_link protip_title
end

When /^I view the protips index page$/ do 
	visit_index_page
end

When /^I click on "(.*?)" within the protip "(.*?)"$/ do |adder_name, protip_title|
	within(".protip-show") do 
		click_link adder_name
	end
end

When /^I enter "(.*?)" in the comment field$/ do |comment|
	visit_show_page
	fill_in "comment", :with => comment
end

When /^I click submit comment$/ do
	click_link "Add Comment"
end

When /^I enter nothing in the comment field$/ do
	visit_show_page
	fill_in "comment", :with => ""
end

When /^I click on the upvote link for a comment$/ do
end

When /^I click on the undo link$/ do
end

# Then

Then /^I should be able to enter protips title$/ do
	visit_form_page
	fill_in "protip_title", :with => "Something"
end

Then /^I should be able to enter protips content$/ do
	visit_form_page
	fill_in "protip_content", :with => "This is a content."
end

Then /^I should see a success protip created message$/ do
	page.should have_content "Protip Created"
end

Then /^I should see the protip show page with the title "(.*?)" and content "(.*?)" and "(.*?)" as adder name$/ do |protip_title, protip_content, adder_name|
	page.find(".title").should have_content protip_title
	page.find(".content").should have_content protip_content
	page.find(".adder-name").should have_content adder_name
end

Then /^I should be redirected back to protips index page$/ do
	page.should have_css(".protips-index")
end

Then /^I should see a protip creation error message$/ do 
	page.should have_content "Please complete the form."
end

Then /^The protip with content "(.*?)" should not exist$/ do |protip_content|
end

Then /^The protip with title "(.*?)" should not exist$/ do |protip_title|
	click_link "Philly Tips"
	page.should have_no_content protip_title
	click_link "Penn Tips"
	page.should have_no_content protip_title
	click_link "Interview Tips"
	page.should have_no_content protip_title
	click_link "Miscellaneous"
	page.should have_no_content protip_title
end

Then /^I should see the four categories$/ do
	visit_index_page
	page.should have_content "Philly Tips"
	page.should have_content "Penn Tips"
	page.should have_content "Interview Tips"
	page.should have_content "Miscellaneous"
end

Then /^I should be able to view all protips categorized as "(.*?)"$/ do |category|
	click_link category
	page.should have_content get_all_protip_titles(category)
end

Then /^I should be taken to the show page$/ do
	page.should have_css(".protip-show")
end

Then /^I should be able to view the content of "(.*?)"$/ do |protip_title|
	page.should have_content protip_title
	page.should have_content get_protip_content(protip_title)
end

Then /^I should see the name of the user who posted the protip "(.*?)"$/ do |protip_title|
	page.find(".adder-name").should have_content get_adder_name(protip_title)
	# what if title is not unique?
end

Then /^I should be able to see the comments for "(.*?)"$/ do |protip_title|
	page.should have_content get_all_comments(protip_title)
end

Then /^I should not be able to see the comments for "(.*?)"$/ do |other_protip|
	page.should have_no_content get_all_comments(other_protip)
end

Then /^I should not be able to see the content for "(.*?)"$/ do |other_protip|
	page.should have_no_content get_protip_content(other_protip)
end

Then /^I should see "(.*?)" at the top of the index$/ do |first_protip|
	page.should have_selector('protips-list li:first-child', text: first_protip)
end

Then /^I should see "(.*?)" at the bottom of the index$/ do |last_protip|
	page.should have_selector('protips-list li:last-child', text: last_protip)
end

Then /^I should not be able to view the protips index page$/ do
	page.should have_no_css(".protips-index")
end

Then /^I should not be able to view the protips show page$/ do
  page.should have_no_css(".protip-show")
end

Then /^I should see the profile of "(.*?)"$/ do |adder_name|
	page.should have_css ".profile-show"
	page.should have_content adder_name
end

Then /^I should see equal number of protip titles and adder names$/ do
	num_names = page.all('.adder-name').count
	page.all('.protip-title').count.should eql(num_names)
end

Then /^I should see a success comment created message$/ do
	page.should have_content "Comment added"
end

Then /^I should see "(.*?)" on the protips show page$/ do |comment|
	page.should have_content comment
end

Then /^I should see "(.*?)" along with the comment$/ do |comment_adder|
	page.find(".comment-adder-name").should have_content comment_adder
end

Then /^I should see an comment adding error message$/ do
	page.should have_content "Comment cannot be blank"
end

Then /^I should see all comments for the protip titled "(.*?)"$/ do |protip_title|
	page.should have_content get_all_comments(protip_title)
end

Then /^I should see the name of the user who posted each comment$/ do
	# iterate through all comments 
	page.all(:css, '.comments-list li').each do |li|
		within('li .comment') do
			comment_body = page.find(li).text
			page.should have_content get_comment_adder_name(comment_body)
		end
	end
end

Then /^I should see the comment "(.*?)" as the first comment$/ do |comment|
	page.should have_selector('comment-list li:first-child', text: comment)
end

Then /^I should see the comment "(.*?)" as the second comment$/ do |comment|
	page.should have_selector('comment-list li:nth-child(2)', text: comment)
end

Then /^I should see the comment "(.*?)" as the third comment$/ do |comment|
	page.should have_selector('comment-list li:nth-child(3)', text: comment)
end

Then /^I should see the comment "(.*?)" at the last comment$/ do |comment|
	page.should have_selector('comment-list li:last-child', text: comment)
end

Then /^I should see the date the comment was posted$/ do
end

Then /^I should see how many upvotes a comment for the protip has$/ do
end

Then /^I should see if I have upvoted a comment for the protip$/ do
end

Then /^The number of upvotes for the comment should increase by one$/ do
end

Then /^I should see that I have upvoted the comment$/ do
end

Then /^The upvote link should turn into undo link$/ do
end

Then /^The number of upvotes for the comment should decrease by one$/ do
end

Then /^I should see the upvote link$/ do
end

Then /^I should not see the upvote link$/ do
end
