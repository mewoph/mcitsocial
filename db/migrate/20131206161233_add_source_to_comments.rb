class AddSourceToComments < ActiveRecord::Migration
  def up
  	change_table :comments do 
  		add_column :comments, :source, :string
  	end
  end

  def down
  	change_table :comments do
  		remove_column :comments, :source
  	end
  end
end
