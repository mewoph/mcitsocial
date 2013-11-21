class Comment < ActiveRecord::Base
  attr_accessible :commnet, :commenter_id, :content_id, :upvote_ids
  serialize :upvote_ids, Array
end
