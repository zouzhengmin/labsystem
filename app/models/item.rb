class Item < ApplicationRecord
  has_many :results
  has_many :samples, :through => :results

end
