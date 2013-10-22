# == Schema Information
#
# Table name: courses
#
#  id             :integer          not null, primary key
#  registrar_name :string(255)
#  title          :string(255)
#  professor      :string(255)
#  description    :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Course < ActiveRecord::Base
  attr_accessible :registrar_name
end
