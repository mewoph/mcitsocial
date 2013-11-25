class Category 
	cattr_accessor :categories

	self.categories = 
	[
		["Interview Tips", 1],
		["Penn Tips", 2],
		["Philly Tips", 3],
		["Miscellaneous", 4]
	]

	def self.get(id)
		self.categories.each do |category_name, category_id|
			return category_name if id == category_id
		end

		raise "Not Found"
	end

end 

