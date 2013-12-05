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

  def get_adder_name
  	User.find(:adder_id)
  end

  def adder_name
  	User.find(adder_id)
  end

  def get_created_time
  	created_at.strftime('%b %d, %Y')
  end


end