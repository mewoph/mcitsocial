 class Category < ActiveHash::Base
  self.data = [
    {:id => 1, :name => "Interview Tips"},
    {:id => 2, :name => "Penn Tips"},
    {:id => 3, :name => "Philly Tips"},
    {:id => 4, :name => "Miscellaneous"}
  ]
end 

