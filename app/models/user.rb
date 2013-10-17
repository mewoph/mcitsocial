class User < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :email, :password, :password_confirmation, :profile_picture
  has_attached_file :profile_picture, :styles => { :square => "400x400>", :thumb => "100x100>" }
  devise :database_authenticatable, :registerable, :recoverable, :confirmable, :rememberable, :trackable, :validatable, :timeoutable

end
