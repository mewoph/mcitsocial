class AddCoursesToUser < ActiveRecord::Migration
  def up
  	add_column :users, :courses, :string
  end

  def down
  	remove_column :users, :courses, :string
  end

end
