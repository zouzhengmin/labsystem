class Template < ApplicationRecord

  validates :sample_id, uniqueness: {scope: :item_id, message:"模板已存在或重名！"}

  belongs_to :item
  belongs_to :sample
  has_many :template_values

  has_many :temp_name_mids
  has_many :template_name, :through => :temp_name_mids



end
