class AddIdsToUserAndCourses < ActiveRecord::Migration
  def change
    add_column :users, :course_id, :int
    add_column :courses, :user_id, :int
  end
end
