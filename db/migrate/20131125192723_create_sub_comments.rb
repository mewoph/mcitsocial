class CreateSubComments < ActiveRecord::Migration
  def up
    create_table :sub_comments do |t|
    	t.integer :commenter_id
    	t.string :comment
    	t.integer :content_id
      t.timestamps
    end
  end

  def down
  	drop_table :sub_comments
  end
end