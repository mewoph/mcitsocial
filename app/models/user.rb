class User < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :email, :password, :password_confirmation
  devise :database_authenticatable, :registerable, :recoverable, :confirmable, :rememberable, :trackable, :validatable, :timeoutable

end
