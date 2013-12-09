class RenameQuestionToFeedback < ActiveRecord::Migration
  def up
          rename_table :questions, :feedbacks
  end

  def down
          rename_table :feedbacks, :questions
  end
end