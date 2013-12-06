# == Schema Information
#
# Table name: protips
#
#  id         :integer          not null, primary key
#  adder_id   :integer
#  title      :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  category   :string(255)
#

class Protip < ActiveRecord::Base
  attr_accessible :title, :content, :adder_id, :category

  validates :title, :presence => true
  validates :content, :presence => true
  validates :category, :presence => true
  acts_as_votable

  def get_adder_name
  	User.find(:adder_id)
  end

  def adder_name
  	User.find(adder_id)
  end

  def get_created_time
  	created_at.strftime('%b %d, %Y')
  end

  def count_responses(source)
    count = Comment.where(:content_id => id, :source => source).count
    if count == 1
      return count.to_s + " Response"
    else
      return count.to_s + " Responses"
    end
  end

end
