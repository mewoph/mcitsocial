class AddCategoryIdToProtips < ActiveRecord::Migration
  def up
  	change_table :protips do 
  		add_column :protips, :category_id, :integer
  	end
  end

  def down
  	change_table :protips do
  		remove_column :protips, :category_id
  	end
  end
end
