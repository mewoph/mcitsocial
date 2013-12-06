# == Schema Information
#
# Table name: comments
#
#  id                 :integer          not null, primary key
#  commenter_id       :integer
#  comment            :string(255)
#  content_id         :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  cached_votes_total :integer          default(0)
#  cached_votes_score :integer          default(0)
#  cached_votes_up    :integer          default(0)
#  source             :string(255)
#

class Comment < ActiveRecord::Base
  attr_accessible :comment, :commenter_id, :content_id, :source
  acts_as_votable

  def get_created_time
  	created_at.strftime('%b %d, %Y')
  end

end
