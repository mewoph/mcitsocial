# == Schema Information
#
# Table name: sub_comments
#
#  id           :integer          not null, primary key
#  commenter_id :integer
#  comment      :string(255)
#  content_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class SubComment < ActiveRecord::Base
  attr_accessible :comment, :commenter_id, :content_id


  def get_created_time
  	created_at.strftime('%b %d, %Y')
  end
  
end
