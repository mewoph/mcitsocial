class AddLanguagesAndAreasOfInterestToUser < ActiveRecord::Migration
  
  def up
  	add_column :users, :areas_of_interest, :string
  	add_column :users, :languages, :string
  end

  def down
  	remove_column :users, :areas_of_interest, :string
  	remove_column :users, :languages, :string
  end

end
