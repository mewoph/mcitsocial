class RemoveDefaultBooleanFromUser < ActiveRecord::Migration
  def up
  	change_column_default :users, :is_current_student, nil
  	change_column_default :users, :is_parttime, nil
  end

  def down
  	change_column_default :users, :is_current_student, true
  	change_column_default :users, :is_parttime, false
  end
end
