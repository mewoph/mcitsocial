class RemoveIdsArrayFromComments < ActiveRecord::Migration

  def up
  	change_table :comments do |t|
  		remove_column :comments, :upvote_ids
  	end
  end

  def down
  	change_table :comments do |t|
  		add_column :comments, :upvote_ids, :text
  	end
  end
  
end
