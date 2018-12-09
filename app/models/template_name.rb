class TemplateName < ApplicationRecord

  has_many :template_name_mids
  has_many :templates, :through => :temp_name_mids
end
