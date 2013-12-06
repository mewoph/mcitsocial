class Comment < ActiveRecord::Base
  attr_accessible :comment, :commenter_id, :content_id, :source
  acts_as_votable

  def get_created_time
  	created_at.strftime('%b %d, %Y')
  end

end
