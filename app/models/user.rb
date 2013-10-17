# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  bio                    :string(140)
#  is_current_student     :boolean          default(TRUE)
#  is_parttime            :boolean          default(FALSE)
#  matriculation_date     :date
#  graduation_date        :date
#  previous_work          :text
#  undergrad_major        :string(255)
#  undergrad_school       :string(255)
#  hometown               :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#

class User < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :email, :password, :password_confirmation, :profile_picture
  has_attached_file :profile_picture, :styles => { :square => "400x400>", :thumb => "100x100>" }
  devise :database_authenticatable, :registerable, :recoverable, :confirmable, :rememberable, :trackable, :validatable, :timeoutable

end
