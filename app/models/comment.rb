class Comment < ActiveRecord::Base
  attr_accessible :comment, :commenter_id, :content_id, :upvote_ids
  serialize :upvote_ids, Array
  acts_as_votable

  def get_created_time
  	created_at.strftime('%b %d, %Y')
  end

  def self.sort_by_popularity(unsorted_comments)
  	sorted_comments = []
  	unsorted_comments.each do |unsorted_comment|
  		if sorted_comments.empty?
  			sorted_comments << unsorted_comment
  		else
  			index = 0
  			sorted_comments.each do |sorted_comment|
  				if unsorted_comment.votes.size >= sorted_comment.votes.size
  					sorted_comments.insert(index, unsorted_comment)
  				else
  					index += 1
  				end 
  			end
  		end
  	end
  	sorted_comments
  end
end
