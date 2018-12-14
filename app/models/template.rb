class Template < ApplicationRecord

  belongs_to :item
  belongs_to :sample

  has_many :temp_name_mids
  has_many :template_name, :through => :temp_name_mids



end
