# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ActiveRecord::Base
  attr_accessible :name
  has_many :feedbacks
  paginates_per 5
  validates :name, :presence => {:message => "Company name cannot be blank"}, :uniqueness => true

  searchable do #can only search text fields on solr, so need to convert our string fields to text
    text :name
    string  :sort_name do
      name.downcase.gsub(/^(an?|the)/, '')
    end
  end

#TODO - add order to questions and comments

  # scope :questions, lambda {
  #   feedbacks.where(:is_question => true)
  # }

  # scope :comments, lambda {
  #   feedbacks.where(:is_question => false)
  # }


  def num_questions
  	count = 0
  	feedbacks.each do |f|
  		count += 1 if f.is_question
  	end
  	count
    #feedback.all.where("is_question" = true).count //won't something like this work here?
  end

  def num_comments
  	count = 0
  	feedbacks.each do |f|
  		count += 1 if not f.is_question
  	end
  	count
  end

end
