class RemoveQuestionColumnFromFeedback < ActiveRecord::Migration
  def up
  	change_table :feedbacks do |t|
  		remove_column :feedbacks, :question
  	end
  end

  def down
  	change_table :feedbacks do |t|
  		add_column :feedbacks, :question, :string
  	end
  end
end
