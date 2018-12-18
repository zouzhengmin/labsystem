class Sample < ApplicationRecord
  has_many :templates, dependent: :destroy
  has_many :items, :through => :templates

  has_ancestry
end
