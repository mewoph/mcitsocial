class Comment < ActiveRecord::Base
  attr_accessible :comment, :commenter_id, :content_id, :upvote_ids
  serialize :upvote_ids, Array
  acts_as_votable

  def get_created_time
  	created_at.strftime('%b %d, %Y')
  end

end
