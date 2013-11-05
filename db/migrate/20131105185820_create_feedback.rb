class CreateFeedback < ActiveRecord::Migration
  def up
  	change_table :feedbacks do |t|
  		t.string :feedback_content
  		t.boolean :is_question
  	end
  end

  def down
  	change_table :feedbacks do |t|
  		remove_column :feedbacks, :feedback_content
  		remove_column :feedbacks, :is_question
  	end
  end
end
