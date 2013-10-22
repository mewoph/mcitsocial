class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
    	t.string :registrar_name
    	t.string :title
    	t.string :professor
    	t.string :description
      t.timestamps
    end
  end
end
