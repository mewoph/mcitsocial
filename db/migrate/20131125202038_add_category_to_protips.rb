class AddCategoryToProtips < ActiveRecord::Migration
  def up
  	change_table :protips do 
  		add_column :protips, :category, :string
  	end
  end

  def down
  	change_table :protips do
  		remove_column :protips, :category
  	end
  end
end
