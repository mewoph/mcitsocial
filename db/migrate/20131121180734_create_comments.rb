class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
    	t.integer :commenter_id
    	t.string :comment
    	t.integer :content_id
    	t.text :upvote_ids
      t.timestamps
    end
  end

  def down
  	drop_table :comments
  end
end
