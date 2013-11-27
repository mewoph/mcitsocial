class SubComment < ActiveRecord::Base
  attr_accessible :comment, :commenter_id, :content_id
end
