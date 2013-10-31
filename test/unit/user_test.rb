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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
