class Item < ApplicationRecord
  has_many :templates
  has_many :samples, :through => :templates

end
