class Protip < ActiveRecord::Base
  attr_accessible :title, :content, :adder_id

  def get_adder_name
  	User.find(:adder_id)
  end
end
