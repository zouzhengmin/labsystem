class Sample < ApplicationRecord
  has_many :results
  has_many :items, :through => :results

end
