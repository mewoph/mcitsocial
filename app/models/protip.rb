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
#

class Protip < ActiveRecord::Base
  attr_accessible :title, :content, :adder_id

  def get_adder_name
  	User.find(:adder_id)
  end
end
