# == Schema Information
#
# Table name: users
#
#  id                           :integer          not null, primary key
#  first_name                   :string(255)
#  last_name                    :string(255)
#  bio                          :string(140)
#  is_current_student           :boolean
#  is_parttime                  :boolean
#  matriculation_date           :date
#  graduation_date              :date
#  previous_work                :text
#  undergrad_major              :string(255)
#  undergrad_school             :string(255)
#  hometown                     :string(255)
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  email                        :string(255)      default(""), not null
#  encrypted_password           :string(255)      default(""), not null
#  reset_password_token         :string(255)
#  reset_password_sent_at       :datetime
#  remember_created_at          :datetime
#  sign_in_count                :integer          default(0)
#  current_sign_in_at           :datetime
#  last_sign_in_at              :datetime
#  current_sign_in_ip           :string(255)
#  last_sign_in_ip              :string(255)
#  confirmation_token           :string(255)
#  confirmed_at                 :datetime
#  confirmation_sent_at         :datetime
#  unconfirmed_email            :string(255)
#  profile_picture_file_name    :string(255)
#  profile_picture_content_type :string(255)
#  profile_picture_file_size    :integer
#  profile_picture_updated_at   :datetime
#  areas_of_interest            :string(255)
#  languages                    :string(255)
#  courses                      :string(255)
#

class User < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :email, :password, :password_confirmation, :profile_picture, :first_name, :last_name, :matriculation_date, :graduation_date, :bio, :undergrad_major, :undergrad_school, :hometown, :previous_work, :areas_of_interest, :languages, :is_current_student, :courses
  has_attached_file :profile_picture, :styles => { :square => "400x400>", :thumb => "100x100>"}
  devise :database_authenticatable, :registerable, :recoverable, :confirmable, :rememberable, :trackable, :validatable, :timeoutable
  validates_length_of :bio, :maximum => 140, :too_long  => "Bio is over 140 chars."


  #TODO Test this???
  # Gets the full name of of the user
  def full_name
  	if first_name.blank? && last_name.blank?
  		email
  	elsif first_name.blank?
  		last_name
  	elsif last_name.blank?
  		first_name
  	else
  		first_name + " " + last_name
  	end
  end

  # Returns the marticulation date in the format "Month Year", ie "September 2013"
  def matriculate
  	if !matriculation_date.blank?
  		matriculation_date.strftime("%B %Y")
  	else
  		"Unknown"
  	end
  end

  def graduate
  	if !graduation_date.blank?
  		graduation_date.strftime("%B %Y")
  	else
  		"Unknown"
  	end
  end

  def full_bio
  	if bio.blank?
  		"No bio available."
  	else
  		bio
  	end
  end

  def full_work_experience
  	if previous_work.blank?
  		"No work experience available."
  	else
  		previous_work
  	end
  end

  def full_undergrad_school
  	if undergrad_school.blank?
  		"Unknown"
  	else
  		undergrad_school
  	end
  end

  def full_undergrad_major
  	if undergrad_major.blank?
  		"Unknown"
  	else
  		undergrad_major
  	end
  end

  def full_hometown
  	if hometown.blank?
  		"Unknown"
  	else
  		hometown
  	end
  end

  def full_languages
    if languages.blank?
      ""
    else
      languages
    end
  end

  def full_interests
    if areas_of_interest.blank?
      ""
    else
      areas_of_interest
    end
  end

  def matriculation_year
    if matriculation_date.blank?
      "current"
    else
      matriculation_date.year
    end
  end

end
