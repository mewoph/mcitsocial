class CreateProtips < ActiveRecord::Migration
	def up
		create_table :protips do |t|
			t.integer :adder_id
			t.string :title
			t.text :content
			t.timestamps
		end
	end

	def down
		drop_table :protips
	end

end
