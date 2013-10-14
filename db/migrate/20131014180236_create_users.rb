class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :bio, :limit => 140
    	t.boolean :is_current_student, :default => true
    	t.boolean :is_parttime, :default => false
    	t.date :matriculation_date
    	t.date :graduation_date
    	t.text :previous_work
    	t.string :undergrad_major
    	t.string :undergrad_school
    	t.string :hometown
      t.timestamps
    end
  end
end
